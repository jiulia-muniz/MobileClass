import 'package:flutter/material.dart';

class Tela2 extends StatefulWidget {
  const Tela2({super.key});

  @override
  State<Tela2> createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Dois"), centerTitle: true),
        body: ListView(
          scrollDirection: Axis.horizontal,
          children: [Row(
            mainAxisAlignment: MainAxisAlignment.center,
           
            children: [
              Text("Este cara me inspira diariamente:"),
              SizedBox(height: 20),
              Image.network(
                "https://fwmedia.fandomwire.com/wp-content/uploads/2025/04/07014303/Rengokus-Death-in-Demon-Slayer-1024x576.webp?width=1920&height=1080&quality=85&sharpen=true&format=webp&fit=contain",
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 600,
                  height: 200,
                  child: Text(
                    "Se estiver se sentindo desmotivado ou sentindo que \nnão é bom o suficiente, incendeie o seu coração, \nEnxugue as lágrimas e siga em frente. Quando se entristecer ou se acovardar,\n lembre-se que o fluxo do tempo nunca para, ele não vai te\n esperar enquanto você se afoga em tristeza \n- Kyojuro Rengoku",
                    textAlign: TextAlign.center,
                  
                  ),
                ),
              ),
               Container(
                width: 150,
                height: 600,
                color: Colors.red,
              ),
               Container(
                width: 150,
                height: 600,
                color: const Color.fromARGB(255, 244, 108, 54),
              ),
               Container(
                width: 150,
                height: 600,
                color: const Color.fromARGB(255, 244, 200, 54),
              ),
               Container(
                width: 150,
                height: 600,
                color: const Color.fromARGB(255, 108, 244, 54),
              )
            ],
          ),
          ]
        ),
      ),
    );
  }
}