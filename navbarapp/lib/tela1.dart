import 'package:flutter/material.dart';

class Tela1 extends StatefulWidget {
  const Tela1({super.key});

  @override
  State<Tela1> createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela Um"), centerTitle: true),
        body: ListView(
          children: [Column(
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
                child: Column(
                  children: [
                    Text("OLASDKAJSDLKAJS"),
                    Text("ASKDHAKSDHKASJHD")
                  ],
                ),
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
