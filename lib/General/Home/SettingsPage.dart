import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255,250,200, 1.0),
        appBar: AppBar(
          backgroundColor: const Color(0xff3d4109),
          leading: BackButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text("Configurações", textAlign: TextAlign.right),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.info),
                onPressed: () {
                  showModalBottomSheet<void>(
                    context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 230,
                          color: const Color.fromRGBO(255,250,200, 1.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Container(
                                  child: const Row(
                                    children: <Widget>[
                                      SizedBox(width: 20),
                                      Text('Criado por:\n\n- Miguel dos Santos \n- Pablo Las-Cazas\n- Gabriel El-Dine\n- Fábio Wnuk', textAlign: TextAlign.left),
                                      SizedBox(width: 60),
                                      // Container(
                                      //   height: 200,
                                      //   width: 200,
                                      //   decoration: const BoxDecoration(
                                      //     image: DecorationImage(
                                      //       image: AssetImage('assets/images/logo.jpg'),
                                      //       fit: BoxFit.fill,
                                      //     ),
                                      //   ),
                                      // ),
                                    ]
                                  ),
                                ),
                                const SizedBox(height: 28),
                                ElevatedButton(
                                  child: const Text("Fechar"),
                                  onPressed: () =>
                                      Navigator.pop(context),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                  );
                },
            ),
         ],
        ),
         body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(

                    ),
                    child: const Text("🔧   Ajustes"),
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                              backgroundColor: const Color.fromRGBO(255,250,200, 1.0),
                              child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20), // Remover quando começar à adicionar as opções
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  child: const Text("Fechar"),
                                ),
                              ],
                            )
                          )
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text("🔒   Alterar senha"),
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: const Color.fromRGBO(255,250,200, 1.0),
                            //insetPadding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                const SizedBox(
                                  width: 270,
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Senha antiga: "
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                const SizedBox(
                                  width: 270,
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Senha nova: "
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                const SizedBox(
                                  width: 270,
                                  child: TextField(
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: "Repita a senha: "
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                OutlinedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Salvar", selectionColor: Color.fromRGBO(255,250,200, 1.0))
                                ),
                                const SizedBox(height: 10,)
                              ],
                            ),
                          ),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: const Text("❌   Deletar conta"),
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: const Color.fromRGBO(255,250,200, 1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20), // Remover quando começar à adicionar as opções
                                const Text("Você tem certeza que quer deletar a conta?"),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Sim"),
                                      ),
                                      const SizedBox(width: 10), // Remover quando começar à adicionar as opções
                                      OutlinedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Não")
                                      )
                                    ],
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                              ],
                            ),
                          )
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
        ),
      );
  }
}