import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255,250,200, 1.0),
        appBar: AppBar(
          backgroundColor: const Color(0xff3d4109),
          title: const Text("Exercícios"),
        ),
        body: const Center(
          child: Text(
            "Aqui o monstro cresce",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}