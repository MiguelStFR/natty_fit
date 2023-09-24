import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Página de exercícios"),
        ),
        body: Center(
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