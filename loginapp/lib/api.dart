import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({super.key});

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String? valor; // variavel que recebera o valor http

  @override
  void initState(){// funcao para voltar ao inicio da pagina
    super.initState(); //sempre iniciar ela
    getvalor();
  }

  void getvalor() async {//funcao get valor precisa ser assincrona pois espera dados de outro servico (http)
    final response = await http.get(Uri.parse("https://swapi.dev/api/people/1"));// o get precisa do uri para ler os cabecalhos http

    if(response.statusCode == 200){// se o status da resposta for 200 OK
      final data =  jsonDecode(response.body);// converte o body json para string
      setState(() {
        valor = data["name"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: valor == null ? Center(child: CircularProgressIndicator()) : 
         Center(child: Text("$valor"),) ,
      ),
    );
  }
}