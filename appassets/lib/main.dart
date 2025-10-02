import 'package:appassets/tela2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Assets"), centerTitle: true,),
        body: Center(
          child: Column(
            children: [
              Image.network("https://j.gifs.com/Mwoo2m.gif", width: 250, height: 200,),
              SizedBox(height: 20,),
              Image.asset("assets/images/funny-btss-v-and-jungkook-video-drives-fans-crazy-3.gif", width: 250, height: 200,),
              SizedBox(height: 20,),
              Image.asset("assets/images/suga.gif", width: 250, height: 200,),
              SizedBox(height: 20,),
              Text("texto baixado ", style: TextStyle(fontFamily: "baigon", fontSize: 40)),
              Text("biblioteca do google fonts ", style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 35))),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Tela2()));
              }, child: Icon(Icons.play_arrow))

            ],
          )
        )
      )
    );
  }
}