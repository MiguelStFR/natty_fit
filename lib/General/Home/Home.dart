import 'package:flutter/material.dart';
import 'package:natty_fit/General/inicio/SigInScreen.dart';
import 'package:natty_fit/General/inicio/SignUpPage.dart';
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
      body: Stack(
        children: [
          Container(
            decoration: BackgroundHomeStyle(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'OLÁ, MIGUEL!',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: 135,
                      child: Icon(
                        Icons.settings,
                        color: Colors.white54,
                        size: 40,
                      ),
                    )
                  ],
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
                            height: altura*0.15,
                            width: altura*0.15,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            decoration: ContainerCaloriasPerdidas(),
                            child: const Text(
                              '20',
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                      const SizedBox(height: 20),
                      ///CONTADOR
                      Center(
                        child: Container(
                          height: altura *0.1,
                          width: largura *0.9,
                          decoration: CronometroContainerStyle(),
                          margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "00:00:00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff909b18),
                                  fontSize: 50,
                                ),
                              ),
                              SizedBox(width: 50),
                              RotatedBox(
                                quarterTurns: 0,
                                child: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.white54,
                                  size: 50,
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