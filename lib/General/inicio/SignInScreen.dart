import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:natty_fit/General/Home/HomeScreen.dart';
import 'package:natty_fit/General/Style/WidgetStyle.dart';
import 'package:natty_fit/General/inicio/SignUpPage.dart';
import 'package:natty_fit/sql_repository.dart';

import '../Models/Results.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    //super.dispose();
  }

  void clearTextFields() {
    _emailController.clear();
    _passwordController.clear();
  }

  Future<LogInResult> logIn() async {
    var result = await SQL_Repository.logIn(
        _emailController.text.toString(), _passwordController.text.toString());
    return result;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BackgroundHomeStyle(),
              child: const Padding(
                padding: EdgeInsets.only(top: 60.0, left: 22),
                child: Text(
                  'Olá\n',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0),
              child: Container(
                decoration: SignWidgetStyle(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _emailController,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.check,
                              color: Colors.white54,
                            ),
                            label: Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      TextField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.visibility_off,
                              color: Colors.white54,
                            ),
                            label: Text(
                              'Password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Colors.red.withOpacity(0),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                side: BorderSide(color: Colors.white)),
                          ),
                          child: const SizedBox(
                            height: 55,
                            width: 300,
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            bool isEmailEmpty = _emailController.text.isEmpty ? true : false;
                            bool isPasswordEmpty = _passwordController.text.isEmpty ? true : false;
                            bool isBoth = isEmailEmpty == true && isPasswordEmpty == true ? true : false;

                            if (isBoth) {
                              Fluttertoast.showToast(
                                  msg: "The fields are empty",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.blueGrey,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            } else {
                              if (isEmailEmpty) {
                                Fluttertoast.showToast(
                                    msg: "The email field is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueGrey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                              if (isPasswordEmpty) {
                                Fluttertoast.showToast(
                                    msg: "The password field is empty",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueGrey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }

                            if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                              var result = await logIn();
                              if (result.result == false) {
                                Fluttertoast.showToast(
                                    msg: result.message,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.blueGrey,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                clearTextFields();
                              } else {
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
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(id: result.id))); //TODO Aplicar o fix para esse probleminha aqui
                              }
                            }
                          }),
                      const SizedBox(
                        height: 150,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.blueGrey),
                                onPressed: () {
                                  //Navigator.pop(context); //TODO Checar com o Miguel sobre isso daqui
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SignUpPage()));
                                },
                                child: const Text('Sign up'))
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
