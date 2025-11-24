import 'package:avaliacao3/home.dart';
import 'package:flutter/material.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myindex = 0; // variavel que indica o index da tela desejada

  void changeindex(int newindex){
    setState(() {
      myindex = newindex;
    });
  }

  List<Widget> screens = [
    Home(),
    Home(),
    // Tela2(),
    // Tela3()
    
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: screens.elementAt(myindex),// o conteudo sera algum elemento da lista
        bottomNavigationBar: // footer, barra de navegação
        BottomNavigationBar(items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(label:"Tela 1", icon: Icon(Icons.heat_pump_rounded)),
          BottomNavigationBarItem(label:"Tela 2", icon: Icon(Icons.heat_pump_rounded)),
          // BottomNavigationBarItem(label:"Tela 3", icon: Icon(Icons.heat_pump_rounded))
        ],
        currentIndex: myindex, //Currentindex: qual o index atual? R: my index
        onTap: changeindex, // ontap: qual a função que muda o index? R: changeindex
        ),
      )
    );
  }
}