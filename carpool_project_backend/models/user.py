from pydantic import BaseModel
from typing import Annotated, Union

class User(BaseModel):
    user_name: str
    real_name: str
    password: str
    phone_number: str
    email: str
    car_number: int
    car_color: str
    car_type: str
    # car_license: str
    homeroom: str
    user_type: str
    warning: list[str]
    penalty: int
    disabled: Union[bool, None] = None

class User_login(BaseModel):
    username: str
    password: str

class email(BaseModel):
    email:str

class EP(BaseModel):
    email: str
    password: str


