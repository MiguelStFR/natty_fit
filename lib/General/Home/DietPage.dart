import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natty_fit/General/Style/WidgetStyle.dart';

class DietPage extends StatelessWidget {
  const DietPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Dieta'),
      ),
      body: const DietScreenBody(),
    );
  }
}

class DietScreenBody extends StatelessWidget {
  const DietScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
      child: Container(
        decoration: SignWidgetStyle(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Informações da Dieta do Usuário
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Informações da Dieta do Usuário',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Adicione aqui as informações da dieta do usuário
                  // Pode ser um Text ou outro widget que exiba as informações.
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Relatório Nutricional Mensal
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Relatório Nutricional Mensal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Adicione aqui o relatório nutricional mensal
                  // Pode ser um Text ou outro widget que exiba o relatório.
                ],
              ),
            ),
            SizedBox(height: 16.0),

            // Placeholder
            Container(

              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'Placeholder',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            SizedBox(height: 16.0),

            // Botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Lógica para adicionar dieta
                  },
                  child: Text('Adicionar Dieta'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Lógica para modificar o placeholder
                  },
                  child: Text('Modificar Placeholder'),
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}