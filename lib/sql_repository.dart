import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:natty_fit/General/Models/logInResult.dart';
import 'package:natty_fit/General/Models/signInResult.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQL_Repository {

  static Future<sql.Database> _loadDatabase() async {
    final databasePath = await getDatabasesPath();
    final databaseLocation = join(databasePath, 'primaryDB.db');
    var db = await openDatabase(
        databasePath,
        version: 1,
        onCreate: (db, dbRecentVersion){
          String sql =
              "CREATE TABLE user_table (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password_hash TEXT, name TEXT, born_date TEXT, height REAL, weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              "CREATE TABLE exercises_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, difficulty_level INTEGER, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              "CREATE TABLE food_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, food_groupId INTEGER, calories REAL, unit_weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              "CREATE TABLE food_group_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT,inactive INTEGER DEFAULT 0)";
          db.execute(sql);
        }
    );
    return db;
  }

  static Future<SignInResult> addUser(String name ,String email, String password, String confirmPassword) async {
    if(password != confirmPassword){
      var signInResult = SignInResult(false, "Passwords don't match");
      return signInResult;
    }

    final db = await SQL_Repository._loadDatabase();
    var hashedPassword = sha256.convert(utf8.encode(password));

    var emailValidation = await db.query('user_table', where: "email = ?", whereArgs: [email], limit: 1);
    if(emailValidation.isEmpty){
      var signInResult = SignInResult(false, "Email or Password already registered");
      return signInResult;
    }
    var passwordValidation = await db.query('user_table', where: "password_hash = ?", whereArgs: [hashedPassword.toString()], limit: 1);
    if(passwordValidation.isEmpty){
      var signInResult = SignInResult(false, "Email or Password already registered");
      return signInResult;
    }

    final data = {'name': name, 'email': email, 'password': hashedPassword.toString(), 'inactive': 0};
    final response = await db.insert('user_table', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

    if(response != 0){
      var signInResult = SignInResult(true, "User Registered");
      return signInResult;
    }
    else {
      var signInResult = SignInResult(false, "Error when registering the User");
      return signInResult;
    }
  }

  static Future<LogInResult> logIn(String email, String password) async{
    final db = await SQL_Repository._loadDatabase();
    var hashedPassword = sha256.convert(utf8.encode(password));
    var result = await db.query('user_table', where: "email = ? AND password_hash = ?", whereArgs: [email, hashedPassword.toString()], limit: 1);

    if(result.isEmpty){
      var logInResult = LogInResult(false, "Wrong Email or Password, try again");
      return logInResult;
    }
    else{
      var logInResult = LogInResult(true, "Logged in");
      return logInResult;
    }
  }

  static Future<int> fillUserData(int id, String bornDate, double height, double weight) async {
    final db = await SQL_Repository._loadDatabase();
    final data = {'born_date': bornDate, 'height': height, 'weight': weight, 'update_date': DateTime.now().toString()};

    // var user =
    //
    final result = await db.update('user_table', data, where: "id = ?", whereArgs: [id]);
    return result;
  }
}