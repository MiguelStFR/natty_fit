import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Criado por:\n- Pablo Las-Cazas\n- Miguel dos Santos'),
                                const SizedBox(height: 24),
                                ElevatedButton(
                                  child: const Text("Fechar"),
                                  onPressed: () =>
                                      Navigator.pop(context),
                                )
                              ],
                            )
                          )
                        );
                      },
                  );
                },
            ),
         ],
        ),
         body: const Center(
              child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // ElevatedButton(
                    //   child: const Text("Sobre o App"),
                    //     onPressed: () {
                    //       showModalBottomSheet<void>(
                    //           context: context,
                    //           builder: (BuildContext context) {
                    //             return Container(
                    //               height: 200,
                    //               color: Colors.white,
                    //               child: Center(
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.center,
                    //                   mainAxisSize: MainAxisSize.min,
                    //                   children: <Widget>[
                    //                     const Text('Criado por:\n- Pablo Las-Cazas\n- Miguel dos Santos'),
                    //                     const SizedBox(height: 24),
                    //                     ElevatedButton(
                    //                       child: const Text("Close"),
                    //                       onPressed: () =>
                    //                           Navigator.pop(context),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //             );
                    //           },
                    //       );
                    //     },
                    // ),
                  ],
              ),
            ),
        ),
      );
  }
}