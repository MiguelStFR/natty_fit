import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Exercise {
  final String name;
  final String description;

  Exercise(this.name, this.description);
}

class ExercisesPage extends StatelessWidget {
  final List<Exercise> exercises = [
    Exercise('Flexão de Braço', 'Descrição da flexão de braço.'),
    Exercise('Agachamento', 'Descrição do agachamento.'),
    Exercise('Abdominais', 'Descrição dos abdominais.'),
    Exercise('Prancha', 'Descrição da prancha.'),
    Exercise('Supino', 'Descrição do supino.'),
  ];

  ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios de Academia'),
      ),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          return ExerciseCard(
            exercise: exercises[index],
          );
        },
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  ExerciseCard({required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              exercise.description,
              style: TextStyle(
                fontSize: 14.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}