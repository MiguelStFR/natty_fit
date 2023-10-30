import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:natty_fit/General/Home/Home.dart';
import 'package:natty_fit/General/Home/ExercisesPage.dart';
import 'package:natty_fit/General/Home/DietPage.dart';


class HomeScreen extends StatefulWidget {
  final int id;
  const HomeScreen({super.key, required this.id});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _selectedIndex = 1;
  late PageController pc;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    super.initState();
    pc = PageController(initialPage: _selectedIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  setPaginaAtual(pagina) {
    setState(() {
      _selectedIndex = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        onPageChanged: setPaginaAtual,
        children: [
          ExercisesPage(),
          Home(id: widget.id),
          DietPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1.0),
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.sports_martial_arts), label: 'Exercícios', ),
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.restaurant_menu), label: 'Dieta'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: const Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },

      ),
    );
  }
}
