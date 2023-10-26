import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:natty_fit/General/inicio/WelcomeScreen.dart';
import 'package:natty_fit/sql_repository.dart';

import '../Models/Results.dart';

class SettingsPage extends StatelessWidget{
  final int id;
  SettingsPage({super.key, required this.id});

  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    //super.dispose();
  }

  void clearTextFields() {
    _oldPasswordController.clear();
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  Future<UpdatePasswordResult> _updatePassword(int id) async {
    var result = await SQL_Repository.updatePassword(
        id,
        _oldPasswordController.text.toString(),
        _newPasswordController.text.toString(),
        _confirmPasswordController.text.toString());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(7, 32, 52, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(7, 32, 52, 1.0),
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
                          color: const Color.fromRGBO(7, 32, 52, 1.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Row(
                                  children: <Widget>[
                                    SizedBox(width: 20),
                                    Text('Criado por:\n\n- Miguel dos Santos \n- Pablo Las-Cazas\n- Gabriel El-Dine\n', textAlign: TextAlign.left, style: TextStyle(color: Colors.white),),
                                    SizedBox(width: 20),
                                    // Container(
                                    //   height: altura * 0.3,
                                    //   width: largura*0.1,
                                    //   decoration: const BoxDecoration(
                                    //     image: DecorationImage(
                                    //       image: AssetImage('assets/images/logo.jpeg'),
                                    //       fit: BoxFit.fitHeight,
                                    //     ),
                                    //   ),
                                    // ),
                                  ]
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
                              backgroundColor: const Color.fromRGBO(7, 32, 52, 1.0),
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
                            backgroundColor: const Color.fromRGBO(7, 32, 52, 1.0),
                            //insetPadding: const EdgeInsets.all(8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    controller: _oldPasswordController,
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        labelText: "Senha antiga: "
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    controller: _newPasswordController,
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        labelText: "Senha nova: "
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                SizedBox(
                                  width: 270,
                                  child: TextField(
                                    controller: _confirmPasswordController,
                                    obscureText: true,
                                    style: const TextStyle(color: Colors.white),
                                    decoration: const InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.white,
                                        ),
                                        labelText: "Repita a senha: "
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                OutlinedButton(
                                    child: const Text("Salvar", selectionColor: Color.fromRGBO(255,250,200, 1.0)),
                                    onPressed: () async {
                                      var result = await _updatePassword(id);
                                      if(result.result == false){
                                        Fluttertoast.showToast(
                                            msg: result.message,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blueGrey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        clearTextFields();
                                      }
                                      else{
                                        Fluttertoast.showToast(
                                            msg: result.message,
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.blueGrey,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        clearTextFields();
                                        if (!context.mounted) return;
                                        Navigator.of(context).pop();
                                      }
                                    },
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
                    child: const Text(
                      "❌   Deletar conta",
                    ),
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: const Color.fromRGBO(7, 32, 52, 1.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20), // Remover quando começar à adicionar as opções
                                const Text(
                                  "Você tem certeza que quer deletar a conta?",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10), // Remover quando começar à adicionar as opções
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      OutlinedButton(
                                        onPressed: () async {
                                          var result = await SQL_Repository.deleteUser(id);
                                          if(!result.result){
                                            Fluttertoast.showToast(
                                                msg: result.message,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blueGrey,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            if (!context.mounted) return;
                                            Navigator.pop(context);
                                          }
                                          else{
                                            Fluttertoast.showToast(
                                                msg: result.message,
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.BOTTOM,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.blueGrey,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                            if (!context.mounted) return;
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const WelcomeScreen()));
                                          }
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