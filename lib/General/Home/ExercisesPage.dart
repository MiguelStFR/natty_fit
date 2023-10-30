import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';
import 'package:natty_fit/General/Models/Exercise.dart';
import 'package:natty_fit/sql_repository.dart';
import '../Models/Results.dart';


class ExercisesPage extends StatefulWidget {

  const ExercisesPage({Key? key}) : super(key: key);
  @override
  _ExercisesPageState createState() => _ExercisesPageState();
}

class _ExercisesPageState extends State<ExercisesPage>{
  bool CSV_charged = false;
  bool databaseExercisesDone = false;
  //final List<List<dynamic>> _exercises = [];
  List<Exercise> _exercises = [];

  void _loadCSV() async{
    final _rawData = await rootBundle.loadString("assets/megaGymDataset.csv");
    List<List<dynamic>> _listExercises =
        const CsvToListConverter().convert(_rawData);
    setState(() {
      for(var exercise in _listExercises){
        Exercise exerciseAux = new Exercise(exercise[0].toString(),exercise[1].toString(), exercise[2].toString(), exercise[3].toString(), exercise[4].toString(), exercise[5].toString(), exercise[6].toString(), exercise[7].toString(), exercise[8].toString());
        _exercises.add(exerciseAux);
      }
      CSV_charged = true;
    });
  }

  Future<ExerciseResult> _fillExerciseDatabase(List<Exercise> ExerciseList) async {
    var result = await SQL_Repository.addExercise(ExerciseList);
    if(result.result = true){
      print("Banco preenchido");
      databaseExercisesDone = false;
    }
    return result;
  }

  Future<List<Exercise>> _filterBylevel(String level) async {
    List<Exercise> result = await SQL_Repository.ExercisesSelectByLevel(level);
    return result;
  }

  Future<List<Exercise>> _filterByType(String type) async {
    List<Exercise> result = await SQL_Repository.ExercisesSelectByLevel(type);
    return result;
  }

  Future<List<Exercise>> _filterByBodyPart(String BodyPart) async {
    List<Exercise> result = await SQL_Repository.ExercisesSelectByLevel(BodyPart);
    return result;
  }

  @override
  Widget build(BuildContext context) {


    if(!CSV_charged)_loadCSV();
    if(!databaseExercisesDone)_fillExerciseDatabase(_exercises);

    List<Exercise> _exercises_test = [];
    for(int i = 0; i < 10; i++) {
      _exercises_test.add(_exercises[i+1]);
    }


    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercícios de Academia'),
      ),
      body: ListView.builder(
        itemCount: _exercises_test.length,
        itemBuilder: (context, index) {
          return ExerciseCard(
            exercise: _exercises_test[index],
          );
        },
      ),
    );
  }
}

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;

  const ExerciseCard({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      exercise.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                    Expanded(
                      child: Text(
                        exercise.description,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    Text(
                      '${exercise.type_exercise} - ${exercise.level} - ${exercise.body_part}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      exercise.equipment,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}