import 'package:appportfolio/tela2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaHome(),
    );
  }
}


class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Portfólio - Jiulia Muniz", style: TextStyle(fontSize: 40, color: Colors.white, fontFamily: "Afacad")), centerTitle: true, backgroundColor: const Color.fromARGB(255, 121, 86, 161),
          toolbarHeight: 200),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("Bem-vindo!", style: TextStyle(fontFamily: "Afacad", fontSize: 60)),
              SizedBox(height: 50,),
              Image.asset("assets/images/jk.jfif", width: 350, height: 370,),
              SizedBox(height: 50,),
              Text("Este é o portfólio da Jiulia", style: TextStyle(fontFamily: "Afacad", fontSize: 20)),
              Text("Clique no botão para saber mais", style: TextStyle(fontFamily: "Afacad", fontSize: 20)),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela2()));
              }, child: Icon(Icons.play_arrow))
            ],
          ),
        ),
      )
    );
  }
}