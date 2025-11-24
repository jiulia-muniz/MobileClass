import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:avaliacao3/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic>? valor;

  @override
  void initState() {
    super.initState();
    getvalor();
  }

  void getvalor() async {
    final response = await http.get(
      Uri.parse("https://swapi.dev/api/people/"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        valor = data["results"];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Todos os personagens",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          toolbarHeight: 120,
          backgroundColor: const Color.fromARGB(255, 23, 99, 109),
        ),
        body: valor == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: valor!.length,
                      itemBuilder: (context, index) {
                        final item = valor![index];
                        return Column(
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              width: double.infinity,
                              height: 100,
                              color: Colors.indigo,
                              child: Center(
                                child: Text(
                                  "${item["name"]}",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: const Text("ver tudo"),
                  ),
                ],
              ),
      ),
    );
  }
}
