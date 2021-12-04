import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rashan_for_you/models/user.model.dart';
import 'package:rashan_for_you/services/LocalDb_services/RashanForYou_Database.dart';

class UserDBService {
  static Future<User> createNewUser(User user) async {
    final db = await RashanForYou_Database.instance.database;
    final id = await db.insert(userTableName, user.toJson());
    print('Successfully Created');
    Fluttertoast.showToast(
        msg: "Account Successfully Created",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.black,
        fontSize: 16.0);
    return user.copy(id: id);
  }

  static Future<User> getLogin(String userEmail, String password) async {
    final db = await RashanForYou_Database.instance.database;
    var res = await db.rawQuery(
        "SELECT * FROM ${userTableName} WHERE ${UserTableFields.userEmail} = '$userEmail' and ${UserTableFields.userPassword} = '$password'");

    if (res.length > 0) {
      return User.fromJson(res.first);
    }

    return null;
  }
}
