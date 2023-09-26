import 'package:flutter/material.dart';
import 'package:natty_fit/General/Home/SettingsPage.dart';
import 'package:natty_fit/General/Style/WidgetStyle.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
          Container(
            decoration: SignWidgetStyle(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColoredBox(
                  //color: const Color.fromRGBO(33, 150, 243, 1.0),
                  color:  Color.fromRGBO(7, 32, 52, 1.0),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 35),
                      const Text(
                        'Olá, Usuário!',
                      textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 21,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 0,
                        child: IconButton(
                          iconSize: 40,
                          icon: const Icon(Icons.settings, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SettingsPage(
                                    ))
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      ///COLUNA INFORMAÇÕES PERSONALIZÁVEIS DO USUÁRIO
                      Center(
                        child: Container(
                          height: altura *0.3,
                          width: largura *0.9,
                          decoration: InformacoesGeraisUsuarioContainerStyle(),
                          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                          alignment: Alignment.topRight,
                          ///CONTAINER COM NÚMERO CUJA UTILIDADE NÃO LEMBRO
                          child: Container(
                            height: altura*0.13,
                            width: altura*0.13,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            decoration: ContainerCaloriasPerdidas(),
                            child: const Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                )
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///COLUNA DADOS EXERCÍCIOS
                          Container(
                            height: MediaQuery.of(context).size.height *0.35,
                            width: MediaQuery.of(context).size.height *0.20,
                            decoration: InformacoesRotinaUsuarioContainerStyle(),
                            margin: const EdgeInsets.only(left: 15, right: 5),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                padding: const EdgeInsets.all(0),
                                child: Column(
                                  children: [
                                    Container(
                                      height: altura * 0.05,
                                      width: largura *19,
                                      margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                      decoration: ContainerExercicios(),
                                    ),
                                    Container(
                                      height: altura * 0.05,
                                      width: largura *19,
                                      margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                      decoration: ContainerExercicios(),
                                    ),
                                    Container(
                                      height: altura * 0.05,
                                      width: largura *19,
                                      margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                      decoration: ContainerExercicios(),
                                    ),
                                    Container(
                                      height: altura * 0.05,
                                      width: largura *19,
                                      margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                      decoration: ContainerExercicios(),
                                    ),
                                    Container(
                                      height: altura * 0.05,
                                      width: largura *19,
                                      margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                      decoration: ContainerExercicios(),
                                    ),
                                    Container(
                                      height: altura * 0.05,
                                      width: largura *19,
                                      margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                      decoration: ContainerExercicios(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ///COLUNA DE DADOS CALORIA, PROTEÍNA, GORDURA
                          Container(
                            height: MediaQuery.of(context).size.height *0.35,
                            width: MediaQuery.of(context).size.height *0.20,
                            decoration: InformacoesRotinaUsuarioContainerStyle(),
                            margin: const EdgeInsets.only(left: 5, right: 15),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Container(
                                  height: altura * 0.11,
                                  width: largura *19,
                                  margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                  decoration: InformacoesCaloricasContainer(),
                                ),
                                Container(
                                  height: altura * 0.11,
                                  width: largura *19,
                                  margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                  decoration: InformacoesCaloricasContainer(),
                                ),
                                Container(
                                  height: altura * 0.11,
                                  width: largura *19,
                                  margin: const EdgeInsets.only(top: 3, left: 3, right: 3),
                                  decoration: InformacoesCaloricasContainer(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ///CONTADOR
                      Center(
                        child: Container(
                          height: altura *0.1,
                          width: largura *0.9,
                          decoration: CronometroContainerStyle(),
                          margin: const EdgeInsets.only(top: 10, left: 24, right: 22),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "00:00:00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  //color: Color(0xff909b18),
                                  color: Color.fromRGBO(255,250,200, 1.0),
                                  fontSize: 50,
                                ),
                              ),
                              SizedBox(width: 50),
                              RotatedBox(
                                quarterTurns: 0,
                                child: Icon(
                                  Icons.play_circle_outline,
                                  //color: Color(0xff909b18),
                                  color: Color.fromRGBO(255,250,200, 1.0),
                                  size: 55,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
        ),
      ),
    );
  }
}

  Widget _cardMenu({
    required String title,
    required String icon,
    VoidCallback? onTap,
    Color color = Colors.white,
    Color fontColor = Colors.grey,
  })
  {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 36,
        ),
        width: 156,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Image.asset(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, color: fontColor),
            )
          ],
        ),
      ),
    );
  }