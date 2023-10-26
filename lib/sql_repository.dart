import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'General/Models/Results.dart';

class SQL_Repository {

  static Future<sql.Database> _loadDatabase() async {
    final databasePath = await getDatabasesPath();
    final databaseLocation = join(databasePath, 'primaryDB.db');
    var db = await openDatabase(
        databaseLocation,
        version: 1,
        onCreate: (db, int version){
          String sql =
              "CREATE TABLE user_table (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password_hash TEXT, name TEXT, born_date TEXT, height REAL, weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n";
              //"CREATE TABLE exercises_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, difficulty_level INTEGER, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              //"CREATE TABLE food_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, food_groupId INTEGER, calories REAL, unit_weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              //"CREATE TABLE food_group_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT,inactive INTEGER DEFAULT 0)";
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
    if(emailValidation.isNotEmpty){
      var signInResult = SignInResult(false, "Email or Password already registered");
      return signInResult;
    }
    var passwordValidation = await db.query('user_table', where: "password_hash = ?", whereArgs: [hashedPassword.toString()], limit: 1);
    if(passwordValidation.isNotEmpty){
      var signInResult = SignInResult(false, "Email or Password already registered");
      return signInResult;
    }

    final data = {'name': name, 'email': email, 'password_hash': hashedPassword.toString(), 'inactive': 0};
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
    List<Map<String, dynamic?>> result = await db.query('user_table', where: "email = ? AND password_hash = ?", whereArgs: [email, hashedPassword.toString()], limit: 1);

    if(result.isEmpty){
      var logInResult = LogInResult(false, "Wrong Email or Password, try again", 0);
      return logInResult;
    }
    else{
      int userId = 0;
      var list = result.toList();
      var logInResult = LogInResult(true, "Logged in", result.first['id']);
      return logInResult;
    }
  }

  static Future<int> fillUserData(int id, DateTime bornDate, double height, double weight) async {
    final db = await SQL_Repository._loadDatabase();
    final data = {'born_date': bornDate, 'height': height, 'weight': weight, 'update_date': DateTime.now().toString()};

    // var dadosBanco = await db.query('user_table', where: "id = ?", whereArgs: [id], limit: 1);
    //
    // User user = User(id, "", "", "", DateTime.now(), height, weight, DateTime.now(), DateTime.now());
    // if(dadosBanco.isNotEmpty){
    //   for (var dbUser in dadosBanco) {
    //     user = dbUser.values as User;
    //   }
    //
    //   user.born_date = bornDate;
    //   user.height = height;
    //   user.weight = weight;
    // }

    final result = await db.update('user_table', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<UpdatePasswordResult> updatePassword(int id, String oldPassword, String newPassword, String confirmPassword) async{
    if(newPassword != confirmPassword){
      var resultValidation = UpdatePasswordResult(false, "Passwords don't match");
      return resultValidation;
    }

    final db = await SQL_Repository._loadDatabase();
    var hashedOldPassword = sha256.convert(utf8.encode(oldPassword));
    var hashedNewPassword = sha256.convert(utf8.encode(newPassword));
    var resultQuery = await db.query('user_table', where: "password_hash = ? AND id = ?", whereArgs: [hashedOldPassword.toString(), id], limit: 1);
    if(resultQuery.isEmpty){
      var resultValidation = UpdatePasswordResult(false, "Incorrect password, try again");
      return resultValidation;
    }

    final data = {'password_hash': hashedNewPassword.toString() };
    final result = await db.update('user_table', data, where: "id = ?", whereArgs: [resultQuery.first['id']]);
    if(result != 0){
      var resultValidation = UpdatePasswordResult(true, "Password updated");
      return resultValidation;
    }
    var resultValidation = UpdatePasswordResult(false, "Operation Failed");
    return resultValidation;
  }

  static Future<DeleteUserResult> deleteUser(int id) async{
    final db = await SQL_Repository._loadDatabase();
    var validation = await db.query('user_table', where: "id = ?", whereArgs: [id], limit: 1);
    if(validation.isEmpty){
      var deleteResult = DeleteUserResult(false, "User not found");
      return deleteResult;
    }

    var result = await db.delete('user_table', where: "id = ?", whereArgs: [id]);
    if(result != 0){
      var deleteResult = DeleteUserResult(true, "Success");
      return deleteResult;
    }
    else{
      var deleteResult = DeleteUserResult(false, "Operation Failed");
      return deleteResult;
    }
  }
}