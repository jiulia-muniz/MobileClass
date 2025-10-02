import 'package:flutter/material.dart';

class Tela2 extends StatelessWidget {
  const Tela2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Portfólio - Jiulia Muniz", style: TextStyle(fontSize: 40, color: Colors.white, fontFamily: "Afacad")), centerTitle: true, backgroundColor: const Color.fromARGB(255, 121, 86, 161),
          toolbarHeight: 200),
          body: Center(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            child: Row(
              children: [
                SizedBox(height: 50,),
                Image.asset("assets/images/jk.jfif", width: 350, height: 370,),
                SizedBox(height: 50,),
                Column(
                 children: [
                  Text("Meu nome é Jiulia e eu tenho 17 anos \n Sou uma jovem em busca de seus sonhos.", style: TextStyle(fontFamily: "Afacad", fontSize: 20)),
                  Text("Quero me tornar uma jovem financeiramente realizada,\n e com conhecimentos em abundância.", style: TextStyle(fontFamily: "Afacad", fontSize: 20)),

                 ],

                )

              ],
            ),
          ),
      )
    );
  }
}