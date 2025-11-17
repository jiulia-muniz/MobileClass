import 'package:bdapp/post.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // importa a biblioteca firebase_score
import 'package:cloud_firestore/cloud_firestore.dart'; // importa a biblioteca cloud_firestore
import 'firebase_options.dart';// importa firebase options ele serve como ponte para a plataforma que voce esta usando

void main() async {// função main vira assincrona pois espera o firebase inicializar
  WidgetsFlutterBinding.ensureInitialized(); // inicia os componentes
  await Firebase.initializeApp( // espera o firebase inicializar
  options: DefaultFirebaseOptions.currentPlatform //define o tipo de plataforma que o firebase ira iniciar
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaGet()
    );
  }
}

class TelaGet extends StatefulWidget {
  const TelaGet({super.key});

  @override
  State<TelaGet> createState() => _TelaGetState();
}

class _TelaGetState extends State<TelaGet> {
  // eh aqui que eu crio a logica da minha tela
  String? temperatura; //variavel que recebera o valor do banco

  @override
  void initState(){ // funcao que reinicia o ciclo toda vez que voce entrar na pagina
    super.initState();
    getValue();
  }

  void getValue(){//funcao que busca o valor no banco
  // crio uma instancia do banco que me retorna os dados 
  //snapshots sao os retornos
  // listen --> lista os retornos
  FirebaseFirestore.instance.collection("temperature").snapshots().listen(
    (snapshot){
      final data = snapshot.docs.first.data(); // retorna o primeiro documento da tabela
      setState(() {// usado para modificar o valor da variavel 
        temperatura = data["temperature"];
      });
    }
  );

  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Tela de Get do banco"),),
        body: Center(
          child: Column(
            children: [
              Text("Essa é a sua temperatura do banco"),
              Text("$temperatura"),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PostPage()));
              }, child: Text("Ir para a pagina POST!"))
            ],
          )
        )
      )
    );
  }
}