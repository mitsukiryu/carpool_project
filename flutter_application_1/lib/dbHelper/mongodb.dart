import 'dart:developer';
import 'package:flutter_application_1/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();

    inspect(db);
    userCollection = db.collection(USER_CONNECTION);
  }

  static Future<void> insert() async {
    try {} catch (e) {
      print(e.toString());
    }
  }
}
