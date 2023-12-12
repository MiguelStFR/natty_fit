import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'General/Models/Results.dart';
import 'General/Models/Exercise.dart';
import 'General/Models/User.dart';

class SQL_Repository {

  static Future<sql.Database> _loadDatabase() async {
    final databasePath = await getDatabasesPath();
    final databaseLocation = join(databasePath, 'primaryDB.db');
    var db = await openDatabase(
        databaseLocation,
        version: 1,
        onCreate: (db, int version){
          String createUserTable =
              "CREATE TABLE user_table (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password_hash TEXT, name TEXT, born_date TEXT, height REAL, weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n";
              //"CREATE TABLE food_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, food_groupId INTEGER, calories REAL, unit_weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              //"CREATE TABLE food_group_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT,inactive INTEGER DEFAULT 0)";
          String createExercisesTable = "CREATE TABLE exercises_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, description TEXT, type_exercise TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, body_part TEXT, equipment TEXT, level TEXT)\n";
          db.execute(createUserTable);
          db.execute(createExercisesTable);
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

  static Future<ExerciseResult> addExercise(List<Exercise> exerciseList) async {
    int response = 1;

    final db = await SQL_Repository._loadDatabase();

    for(var exercise in exerciseList) {
      final data = {
        'name': exercise.name,
        'description': exercise.description,
        'type_exercise': exercise.type_exercise,
        'body_part': exercise.body_part,
        'equipment': exercise.equipment,
        'level': exercise.level
      };
      final responseAux = await db.insert('exercises_table', data);
      if(responseAux == 0){
        response = responseAux;
        break;
      }
    }
    if(response != 0){
      var exerciseResult = ExerciseResult(true, "Exercise Added");
      return exerciseResult;
    }
    else {
      var exerciseResult = ExerciseResult(false, "Error when adding the Exercise");
      return exerciseResult;
    }
  }

  static List<ExerciseCard> ExerciseCardList(List result){
    List<ExerciseCard> exerciseListAux = [];
    for (var exer in result) {
      ExerciseCard ExerciseAux = ExerciseCard(exer['id'].toString(), exer['name'], exer['description'], exer['type_exercise'], exer['createdAt'], exer['body_part'], exer['equipment'], exer['level']);
      exerciseListAux.add(ExerciseAux);
    }
    return exerciseListAux;
  }

  static Future<List<ExerciseCard>> ExercisesSelectByType(String type) async{
    final db = await SQL_Repository._loadDatabase();
    List result = await db.query('exercises_table', where: "type_exercise = ?", whereArgs: [type], limit: 6);
    return ExerciseCardList(result);
  }

  static Future<List<Exercise>> ExercisesSelectByBodyPart(String BodyPart) async{
    final db = await SQL_Repository._loadDatabase();
    List<Map<String, Object?>> result = await db.query('exercises_table', where: "body_part = ?", whereArgs: [BodyPart], limit: 6);
    List<Exercise> exerciseList = [];

      for (var exercise in result) {
        Exercise exerciseAux = Exercise(
            exercise[0].toString(),
            exercise[1].toString(),
            exercise[2].toString(),
            exercise[3].toString(),
            exercise[4].toString(),
            exercise[5].toString(),
            exercise[6].toString(),
            exercise[7].toString(),
            exercise[8].toString());
        exerciseList.add(exerciseAux);
      }
      return exerciseList;
  }
  static Future<List<Exercise>> ExercisesSelectByOneParameter(String column, String whereArgs) async{
    final db = await SQL_Repository._loadDatabase();
    List<Map<String, Object?>> result = await db.query('exercises_table', where: '$column = ?', whereArgs: [whereArgs], limit: 6);
    List<Exercise> exerciseList = [];

    for (var exercise in result) {
      Exercise exerciseAux = Exercise(
          exercise[0].toString(),
          exercise[1].toString(),
          exercise[2].toString(),
          exercise[3].toString(),
          exercise[4].toString(),
          exercise[5].toString(),
          exercise[6].toString(),
          exercise[7].toString(),
          exercise[8].toString());
      exerciseList.add(exerciseAux);
    }
    return exerciseList;
  }

  static Future<List<Exercise>> ExercisesSelectByTwoParameters(String column1, String column2, String whereArgs1, String whereArgs2) async{
    final db = await SQL_Repository._loadDatabase();
    List<Map<String, Object?>> result = await db.query('exercises_table', where: '$column1 = ? and $column2 = ?', whereArgs: [whereArgs1, whereArgs2], limit: 6);
    List<Exercise> exerciseList = [];

    for (var exercise in result) {
      Exercise exerciseAux = Exercise(
          exercise[0].toString(),
          exercise[1].toString(),
          exercise[2].toString(),
          exercise[3].toString(),
          exercise[4].toString(),
          exercise[5].toString(),
          exercise[6].toString(),
          exercise[7].toString(),
          exercise[8].toString());
      exerciseList.add(exerciseAux);
    }
    return exerciseList;
  }


  static Future<List<Exercise>> ExercisesSelectByThreeParameters(String column1, String column2, String column3, String whereArgs1, String whereArgs2, String whereArgs3) async{
    final db = await SQL_Repository._loadDatabase();
    List<Map<String, Object?>> result = await db.query('exercises_table', where: '$column1 = ? and $column2 = ? and $column2 = ?', whereArgs: [whereArgs1, whereArgs2, whereArgs3], limit: 6);
    List<Exercise> exerciseList = [];

    for (var exercise in result) {
      Exercise exerciseAux = Exercise(
          exercise[0].toString(),
          exercise[1].toString(),
          exercise[2].toString(),
          exercise[3].toString(),
          exercise[4].toString(),
          exercise[5].toString(),
          exercise[6].toString(),
          exercise[7].toString(),
          exercise[8].toString());
      exerciseList.add(exerciseAux);
    }
    return exerciseList;
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

  static Future<GetUserFromIdResult> getUserFromId(int id) async {
    final db = await SQL_Repository._loadDatabase();
    List userMap = await db.query('user_table', where: "id = ?", whereArgs: [id], limit: 1);
    if(userMap.isEmpty){
      var getResult = GetUserFromIdResult(false, "User not found", null);
      return getResult;
    }

    for(int i = 0; i < userMap.length; i++){
      User user = new User(userMap['id'], )
    }

    var getResult = GetUserFromIdResult(true, "Success", userMap);
  }
}