import 'package:avaliacao3/compra.dart';
import 'package:avaliacao3/home.dart';
import 'package:avaliacao3/cart.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int myindex = 1; // começa na Home

  List<Widget> screens = [
    CartPage(),  // carrinho
    Home(),      // home
    CompraTela(),      // perfil (coloque sua tela depois)
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
            debugShowCheckedModeBanner: false,

      home: Scaffold(
        body: screens[myindex],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: myindex,
          onTap: (index) {
            setState(() => myindex = index);
          },

          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.orange,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "carrinho",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "home",
            )
          ],
        ),
      ),
    );
  }
}
