import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:natty_fit/General/Models/signInResult.dart';
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

  void clearTextFields(){
    _nameController.clear();
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
  }

  Future<SignInResult> _addUser() async {
    var result = await SQL_Repository.addUser(_nameController.text.toString(), _emailController.text.toString(), _passwordController.text.toString(), _confirmPasswordController.text.toString());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        resizeToAvoidBottomInset : false,
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
                  var result = await _addUser();
                  if(result.result == false){
                    if(result.message == "Passwords don't match"){
                      Fluttertoast.showToast(
                        msg: "Passwords don't match",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      clearTextFields();
                    }
                    if(result.message == "Email or Password already registered"){
                      Fluttertoast.showToast(
                          msg: "Email or Password already registered",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      clearTextFields();
                    }
                    if(result.message == "Error when registering the User"){
                      Fluttertoast.showToast(
                        msg: "Error when registering the User",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      clearTextFields();
                    }
                  }
                  else{
                    Fluttertoast.showToast(
                      msg: "User Registered",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.blueGrey,
                      textColor: Colors.white,
                      fontSize: 16.0
                    );
                    clearTextFields();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                  }
                },
                child:Container(
                        height: 55,
                        width: 300,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Center(
                          child: Text('Sign Up',
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
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Already have an account?",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),),
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.blueGrey
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignInScreen())
                                  );
                                },
                                child: const Text('Sign up')
                            )
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