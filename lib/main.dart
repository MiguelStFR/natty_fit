import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import 'General/inicio/WelcomeScreen.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{

  _loadDatabase() async {
    final databasePath = await getDatabasesPath();
    final databaseLocation = join(databasePath, "primaryDB.db");
    var db = await openDatabase(
        databasePath,
        version: 1,
        onCreate: (db, dbRecentVersion){
          String sql = "CREATE TABLE exercises_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, difficulty_level INTEGER, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              "CREATE TABLE food_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, icon TEXT, food_groupId INTEGER, calories REAL, unit_weight REAL, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT, inactive INTEGER DEFAULT 0)\n"
              "CREATE TABLE food_group_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, update_date TEXT,inactive INTEGER DEFAULT 0)";
          db.execute(sql);
        }
    );
    return db;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: ('inter'),
        useMaterial3: true,
      ),
      home:const WelcomeScreen(),
    );
  }
}