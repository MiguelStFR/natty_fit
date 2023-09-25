import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
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
                          height: 230,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Criado por:\n\n- Miguel dos Santos \n- Pablo Las-Cazas\n- Gabriel El-Dine\n- Fábio Wnuk', textAlign: TextAlign.left,),
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
                                    child: const Text("Salvar")
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
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20), // Remover quando começar à adicionar as opções
                                const Text("Você tem certeza que quer deletar a conta?"),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                Container(
                                    child: Row(
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