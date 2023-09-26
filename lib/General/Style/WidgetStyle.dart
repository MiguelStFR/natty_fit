import 'package:flutter/material.dart';

BoxDecoration BackgroundStyle() {
  return const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Color(0xffbbcb1d),
            Color(0xff757e13),
            Color(0xff3d4109),
            Color(0xFF0E0E05),
          ],
        stops: [0.05, 0.12, 0.25, 0.4],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
  );
}

BoxDecoration BackgroundHomeStyle() {
  return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          // Color(0xff272a06),
          // Color(0xFF000000),
          Color.fromRGBO(33, 150, 243, 1.0),
          Color.fromRGBO(64,224,208, 1.0),
        ],
        stops: [0.25, 0.7],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
  );
}

BoxDecoration SignWidgetStyle(){
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40), topRight: Radius.circular(40)
    ),
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(7, 32, 52, 1.0),
          Color(0xFF0E0E05),
        ],
        stops: [0.35, 0.6],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
  );
}

BoxDecoration InformacoesGeraisUsuarioContainerStyle(){
    return const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35)
      ),
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(33, 150, 243, 1.0),
          Color.fromRGBO(7, 32, 52, 1.0),
        ],
        stops: [ 0.4, 0.7],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
    );
}

BoxDecoration InformacoesCaloricasContainer(){
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15)
    ),
    color: Color.fromRGBO(33, 150, 243, 1.0),
  );
}

BoxDecoration ContainerCaloriasPerdidas(){
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15)
    ),
    //color: Color(0xffbbcb1d),
    color: Color.fromRGBO(73, 174, 253, 1.0),
  );
}

BoxDecoration ContainerExercicios(){
  return const BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15)
    ),
    color: Color.fromRGBO(33, 150, 243, 1.0),
  );
}

BoxDecoration InformacoesRotinaUsuarioContainerStyle(){
  return const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xff3d4109),
          Color(0xff373b09),
          Color(0xff212305),
        ],
        stops: [0.00, 0.4, 0.7],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
  );
}

BoxDecoration CronometroContainerStyle(){
  return const BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
      ),
      gradient: LinearGradient(
        colors: [
          Color(0xff1a1c04),
          Color(0xff0d0e02),
        ],
        stops: [0.2, 0.7],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      )
  );
}
BoxDecoration BackgroundImage(){
  return const BoxDecoration(
    image:DecorationImage(
      image: AssetImage("assets/images/back.png"),
      fit: BoxFit.cover,
    ),
  );
}

