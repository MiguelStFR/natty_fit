import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:natty_fit/General/Constants.dart';


class ProfileMainPage extends StatelessWidget{
  final int id;
  const ProfileMainPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return MaterialApp(
      home: ProfileMain(id: id),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileMain extends StatelessWidget{
  final int id;
  const ProfileMain({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.black),
                      child: const Icon(
                        Icons.account_circle,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text("username", style: Theme.of(context).textTheme.headlineMedium),
              Text("email", style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 20),

              SizedBox(
                width: 200,
                // child: ElevatedButton(
                //   onPressed: () => Get.to(() => ),
                // ),
              )
            ],
          ),
        ),
      ),
    );
  }
}





