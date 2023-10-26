import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'SignInScreen.dart';
import 'SignUpPage.dart';
import 'package:natty_fit/General/Style/WidgetStyle.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BackgroundHomeStyle(),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Text("NattyFit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 80,
                  fontWeight: FontWeight.bold
                )
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text('Só no Suquinho',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
              ),
              const SizedBox(
                height: 200,
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
                  width: 250,
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
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignInScreen()));
                },
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
                child: const SizedBox(
                  height: 55,
                  width: 250,

                  child: Center(child: Text('Sign Up',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                      ),
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),

    );
  }
}