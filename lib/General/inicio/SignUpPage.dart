import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natty_fit/General/inicio/SigInScreen.dart';
import 'package:natty_fit/General/Style/WidgetStyle.dart';
import 'package:natty_fit/sql_repository.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    //super.dispose();
  }

  Future<void> _addUser() async {
    await SQL_Repository.addUser(_nameController.toString(), _emailController.toString(), _passwordController.toString(), _confirmPasswordController.toString());
    }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        body: Stack(//thanks for watching
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BackgroundHomeStyle(),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Crie \nsua Conta',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Container(
                decoration: SignWidgetStyle(),
                height: double.infinity,
                width: double.infinity,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       TextField(
                        keyboardType: TextInputType.text,
                        controller: _nameController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.check,
                              color: Colors.grey,
                            ),
                            label: Text("Nome Completo",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color:Colors.white,
                              ),
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _emailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.check,color: Colors.grey,),
                            label: Text('Email',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                              ),
                            )
                        ),
                        style: const TextStyle(
                            color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(Icons.visibility_off,color: Colors.grey,),
                            label: Text('Senha',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                              ),
                            )
                        ),
                        style: const TextStyle(
                            color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _confirmPasswordController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            label: Text('Confirmar Senha',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:Colors.white,
                              ),
                            )
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 70,
                      ),
              GestureDetector(
                onTap: () async{
                  await _addUser();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
                child:Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Center(
                          child: Text('SIGN UP',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
              ),
                      const SizedBox(height: 80,),
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Já tem uma conta?",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                            Text("Sign up",style: TextStyle(///done login page
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.black
                            ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

}