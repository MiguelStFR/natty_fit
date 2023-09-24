import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pagina de dietas"),
        ),
        body: Center(
          child: Text(
            "Aqui o monstro nutre",
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