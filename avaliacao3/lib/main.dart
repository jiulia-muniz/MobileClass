import 'package:avaliacao3/home.dart';
import 'package:avaliacao3/navbar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginPage());
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();

  String correctUser = "Jiu";
  String correctPassword = "123";

  String erro = "";

  void Login() {
    if (user.text == correctUser && password.text == correctPassword) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => NavBar()));

      setState(() {
        erro = "";
      });
    } else {
      setState(() {
        erro = "Existem credenciais incorretas";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          ),

          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/whitee.png",
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width * 0.9,
                  ),
                  Text("Bem-Vindo(a)!", style: TextStyle(color: Colors.white, fontSize: 35)),
                  SizedBox(height: 30,),
                  SizedBox(
                    width: 250,
                    height: 45,
                    child: TextField(
                      controller: user,
                      style: TextStyle(color: Colors.white),

                      decoration: InputDecoration(
                        labelText: 'Usuário',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Insira aqui o seu usuario",
                        hintStyle: TextStyle(color: Colors.white70),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white54),
                        ),

                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 150),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  SizedBox(
                    width: 250,
                    height: 45,
                    child: TextField(
                      controller: password,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "Insira aqui a sua senha",
                        hintStyle: TextStyle(color: Colors.white70),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Colors.white54),
                        ),

                        filled: true,
                        fillColor: Color.fromRGBO(255, 255, 255, 150),
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: Login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      minimumSize: Size(250, 50),
                      shape: ContinuousRectangleBorder(),
                    ),
                    child: Text("entrar"),
                  ),

                  SizedBox(height: 20),

                  Text(erro, style: TextStyle(color: Colors.red, fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
