import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  //variavel que observa o que o user digita
  TextEditingController novatemperatura = TextEditingController();

  @override
  void initState(){ //variavel que reinicia o estado toda vez que incluir uma nova temperatura no banco
    super.initState();
    postValue();
  }

  String? erro;
  Future<void> postValue() async {
    try{
      FirebaseFirestore.instance.collection("temperature").add(
        {
          "temperature": novatemperatura.text,
        }
      );
    }catch(e){
      setState(() {
        erro = "Erro ao enviar dados";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Sua tela post!")),
        body: Center(
          child: Column(
            children: [
              Text("Insira aqui a temperatura desejada"),
              TextField(
                controller: novatemperatura,
              ),
              ElevatedButton(onPressed: postValue, child: Text("Enviar dados"))
            ],
          ),
        )
      ),
    );
  }
}