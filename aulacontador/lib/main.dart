import 'package:flutter/material.dart';

void main() {
  runApp(const Contador());
}

class Contador extends StatefulWidget {
  const Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int valor = 0; // criar variável

  void aumentar() {
    setState(() {
      // alterar o dado da variável na tela
      valor++; // aumenta uma unidade
    });
  }

  void diminuir() {
    setState(() {
      // alterar o dado da variável na tela
      valor--; // diminui uma unidade
    });
  }

  void resetar() {
    setState(() {
      // alterar o dado da variável na tela
      valor = 0; // diminui uma unidade
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //vai provar os componentes para mim
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("App contador",style: TextStyle(fontSize: 40, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          toolbarHeight: 200, //isso aumenta altura do appbar
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Image.network("https://media1.tenor.com/m/ReYJ2g2UMI8AAAAC/rengoku.gif"),
              Text("${valor.toInt()}", style: TextStyle(fontSize: 70)),
              SizedBox(
                height: 20,
              ), //espaçamento de altura entre o 0 e os botoes
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      aumentar(); //chama a função aumentar quando é pressionado
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 30),

                  ElevatedButton(
                    onPressed: () {
                      diminuir();
                    },
                    child: Text("-"),
                  ),
                  SizedBox(width: 30),

                  ElevatedButton(
                    onPressed: () {
                      resetar();
                    },
                    child: Icon(Icons.restore),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
