from fastapi import APIRouter, Query, Depends
from pymongo import MongoClient
from pydantic import BaseModel
from bson.objectid import ObjectId
from passlib.context import CryptContext
import os
import math
import certifi
import datetime as dt
from models.party import Party
from models.user import User
from datetime import datetime, timedelta
from typing import Union
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from jose import JWTError, jwt
from typing_extensions import Annotated
from routers.user import get_current_active_user

router = APIRouter(
    prefix ='/party', 
    tags=['party'],
)

router.mongodb_client = MongoClient("mongodb+srv://kevinkim9443:0509@carpool.3bukgzs.mongodb.net/?retryWrites=true&w=majority",tlsCAFile=certifi.where())
router.database = router.mongodb_client["Carpool"]

#party create

@router.post("/create/{user_id}")
async def create_party(user_id: str, new_party:Party, current_user: User = Depends(get_current_active_user)):
    data = new_party.dict()
    data["party_recruiter_id"] = user_id
    data["cur_recruitment"] = 0
    result = router.database.party.insert_one(data)

    return {"message": "Party registration is successful."}

#party edit

@router.put("/edit/{party_id}")
async def edit_party(party_id: str, edited_party: Party, current_user: User = Depends(get_current_active_user)):

    data = edited_party.dict(exclude_unset=True)

    result = router.database.party.update_one({"_id": ObjectId(party_id)}, {"$set": data})   # 1번째 param: 수정할 document 추적, 2번째 param: 덮어씌울 데이터

    if result.modified_count == 1:
        return {"message": "Party updated successfully."}
    else:
        return {"message": "Party not found."}

#party delete

@router.delete("/delete/{party_id}")
async def delete_party(party_id: str, current_user: User = Depends(get_current_active_user)):

    result = router.database.party.delete_one({"_id": ObjectId(party_id)})   # 삭제할 document 추적

    if result.deleted_count == 1:
        return {"message": "Party deleted successfully."}
    else:
        return {"message": "Party not found."}

#find_party
@router.get("/find")
async def get_party_list():
    docs = router.database.party.find()

    party_list = []
    all_party_list = []

    crt_time = str(dt.datetime.now())
    print("Current time is " + crt_time)

    for party in docs:
        party["_id"] = str(party["_id"])
        all_party_list.append(party)

        if party["date_time"] > crt_time:
            party_list.append(party)
    
    return party_list
        
#current_party
@router.get("/find/current/{user_id}")
async def get_current_party(user_id):
    docs = router.database.party.find({'party_recruiter_id': user_id})
    crt_time = str(dt.datetime.now())

    for party in docs:
        party["_id"] = str(party["_id"]) 

        if party["date_time"] > crt_time:
            return party

#past_party
@router.get("/find/past/{user_id}")
async def get_past_party(user_id):
    docs = router.database.party.find({'party_recruiter_id': user_id})
    crt_time = str(dt.datetime.now())

    for party in docs:
        party["_id"] = str(party["_id"]) 

        if party["date_time"] < crt_time:
            return party

#one_party
@router.get("/find/one/{party_id}")
async def get_one_party(party_id: str):
    docs =  router.database.party.find_one({'_id': ObjectId(party_id)})
    docs["_id"] = str(docs["_id"])
    return docs

#join_party
@router.put("/join/{party_id}/{user_id}")
async def join_party(party_id: str, user_id: str, current_user: User = Depends(get_current_active_user)):
    docs =  router.database.party.find_one({'_id': ObjectId(party_id)})
    if docs["cur_recruitment"] >= docs["max_recruitment"]:
        print("Party is full")
    else:
        docs["party_member_id"].append(user_id)
        docs["cur_recruitment"] += 1
    result = router.database.party.update_one({"_id": ObjectId(party_id)}, {"$set": docs})

# withdraw party
@router.put("/drop/{party_id}/{user_id}")
async def drop_party(party_id: str, user_id: str, current_user: User = Depends(get_current_active_user)):
    docs =  router.database.party.find_one({'_id': ObjectId(party_id)})
    docs["party_member_id"].remove(user_id)
    docs["cur_recruitment"] -= 1
    result = router.database.party.update_one({"_id": ObjectId(party_id)}, {"$set": docs})



# party sort

@router.get("/party/sort/")
async def sort_party(party_type: str = Query(None), destination: str = Query(None), date: str = Query(None), time: str = Query(None)):
    party_list = []
    if party_type is not None and destination is not None:
        party = router.database.party.find({ "$and": [{"destination": destination},{"party_type":party_type}]})
        for each in party:
            party_list.append(each)
   
    if party_type is not None and destination is None:
        party = router.database.party.find({"party_type":party_type})
        for each in party:
            party_list.append(each)

    
    if party_type is None and destination is None:
        party = router.database.party.find()
        for each in party:
            party_list.append(each)

    
    if party_type is None and destination is not None:
        party = router.database.party.find({"destination":destination})
        for each in party:
            party_list.append(each)
    
    final_party = []
    for i in party_list:
        if date is not None and time is None:    
            if i["date_time"].split(" ")[0] >= date:
                final_party.append(i)
        
        if date is None and time is not None:
            if i["date_time"].split(" ")[1][0:7] >= time:
                if i["date_time"].split(" ")[0] >= dt.today():    
                    final_party.append(i)

        if date is not None and time is not None:
            if i["date_time"].split(" ")[0] >= date:
                if i["date_time"].split(" ")[1][0:7] >= time:
                    final_party.append(i)
    
    return final_party

# party search

@router.get("/party/search/{Lat}/{Lng}")
async def search_party(Lat: float , Lng: float):
  # 1km 구간
    lat_change = 1 / 111.19
    lng_change = abs(math.cos(Lat * (math.pi / 180)))
    party = router.database.party.find(
        {
            "$and": [
                {"party_Lat": {"$gt": Lat - lat_change , "$lt": Lat + lat_change}}, # 값 수정하기
                {"party_Lng": {"$gt": Lng - lng_change , "$lt": Lng + lng_change}}
            ]
        }
    )
    for i in party:
        print(i)

# 36.1004
# 129.3882
#999m apart
#36.09382, 129.4051
#36.09701, 129.4155

#over 1km apart
#36.09891, 129.3833
#36.10137, 129.3952
