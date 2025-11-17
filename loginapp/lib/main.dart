import 'package:flutter/material.dart';
import 'package:loginapp/api.dart';
import 'package:loginapp/apiall.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()
    );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //variavel que observa o que foi digitado
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  // variavel com valor correto
  String correctUser = "Jiu";
  String correctPassword = "123";
  // variavel que armazena mensagem de erro
  String erro = "";


  void Login(){
    if(user.text == correctUser && password.text == correctPassword){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ApiPage()));
    
      setState(() {// serve para nao deixar mensagem de erro mesmo dando certo
        erro = "";
      });


    }else{
      setState(() {
        erro = "Existem credenciais incorretas";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Icon(Icons.person, size: 150,),
              SizedBox(
                width: 250,
                height: 45,
                child: TextField(
                  controller: user,
                decoration: InputDecoration(
                  hintText: "Insira aqui o seu usuario",
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                 ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                ),
              ),
              
              SizedBox(height: 30,),
              SizedBox( 
                width: 250,
                height: 45,
                child: TextField(
                  controller: password, // qual variavel que observa o que foi digitado
                decoration: InputDecoration( // decoracao do seu text field
                  hintText: "Insira aqui a sua senha" ,// label dica para o text field
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.deepPurple.shade100),
                  ),
                  filled: true,
                  fillColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                obscureText: true, // deixa a senha privada
              ),
              ),
              
                
                            SizedBox(height: 30,),

              ElevatedButton(onPressed: Login, child: Text("Logar")),
              
              SizedBox(
                height: 20,
              ),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ApiAllPage())
                );
              }, child: Text("ver tudo")),

              Text("$erro")

            ],
          ),
        ),
      )
    );
  }
}