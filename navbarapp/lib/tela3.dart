import 'package:flutter/material.dart';

class Tela3 extends StatefulWidget {
  const Tela3({super.key});

  @override
  State<Tela3> createState() => _Tela3State();
}

class _Tela3State extends State<Tela3> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Este cara me inspira diariamente:"),
        ),
        body: Center(
          child: Column(
            children: [
              Image.network("https://www.icegif.com/wp-content/uploads/2023/11/icegif-33.gif"),
              Text("e estiver se sentindo desmotivado ou sentindo que \nnão é bom o suficiente, incendeie o seu coração, \nEnxugue as lágrimas e siga em frente. Quando se entristecer ou se acovardar,\n lembre-se que o fluxo do tempo nunca para, ele não vai te\n esperar enquanto você se afoga em tristeza - Kyojuro Rengoku")
            ],
          ),
        ),
      )
    );
  }
}