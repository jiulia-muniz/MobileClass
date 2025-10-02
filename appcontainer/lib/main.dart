import 'package:flutter/material.dart';

//-----container------
void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Containers", style:TextStyle(color: Colors.white),), centerTitle: true, toolbarHeight: 120, backgroundColor: Color.fromARGB(255, 69, 139, 148),), 
        //appBar: AppBar(title: Text("Tela Home, olá divos babilonicos!"), centerTitle: true,),
        body: Column(
          // main é o eixo principal y
          // voce pode alinhar em start center ou end
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // cross é o eixo secundario, no caso da coluna o eixo x
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(57, 52, 128, 1),
                  ),
                  child: Text(
                    "1",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),

                //forma normal Colors.black
                // hexadecimal  Color(0XFFFFFF)
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(57, 52, 128, 1),
                  ),
                  child: Text(
                    "2",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  //forma normal Colors.black
                  // hexadecimal  Color(0XFFFFFF)
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(57, 52, 128, 1),
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  //forma normal Colors.black
                  // hexadecimal  Color(0XFFFFFF)
                ),
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromRGBO(57, 52, 128, 1),
                  ),
                  child: Text(
                    "4",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),

                  //forma normal Colors.black
                  // hexadecimal  Color(0XFFFFFF)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
