import 'package:flutter/material.dart';

class DietPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Pagina de dietas"),
        ),
        body: const Center(
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