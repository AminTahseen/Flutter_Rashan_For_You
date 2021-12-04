import 'dart:async';

import 'package:rashan_for_you/models/user.model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: camel_case_types
class RashanForYou_Database {
  static final RashanForYou_Database instance = RashanForYou_Database._init();

  static Database _database;

  RashanForYou_Database._init();

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDB('RashanForYou.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
// Create Tables
    await db.execute('''
CREATE TABLE $userTableName (
  ${UserTableFields.id} INTEGER PRIMARY KEY AUTOINCREMENT, 
  ${UserTableFields.userName} TEXT NOT NULL,
  ${UserTableFields.userEmail} TEXT NOT NULL,
  ${UserTableFields.userAccType} TEXT NOT NULL,
  ${UserTableFields.userPassword} TEXT NOT NULL
  )
  ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
