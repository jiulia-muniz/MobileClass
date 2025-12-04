import 'package:flutter/material.dart';
import 'package:avaliacao3/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> valor = [];

  @override
  void initState() {
    super.initState();
    getvalor();
  }

  void getvalor() async {
    FirebaseFirestore.instance.collection("produtos").snapshots().listen((
      snapshot,
    ) {
      setState(() {
        valor = snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList();
      });
    });
  }

  Future<void> PostCarrinho (dynamic item) async {
    FirebaseFirestore.instance.collection("carrinho").add({
      "produto": item

    }

    );


  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 220,
          centerTitle: true,
          title: Image.asset("assets/images/whitee.png", height: 200),
        ),

        // ----------------------- CONTEÚDO -----------------------
        body: Stack(
          children: [
            // FUNDO
            SizedBox.expand(
              child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
            ),

            // CONTEÚDO POR CIMA DO FUNDO
            valor.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          padding: EdgeInsets.only(top: 20),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.62,
                                crossAxisSpacing: 30,
                                mainAxisSpacing: 20,
                              ),
                          itemCount: valor.length,
                          itemBuilder: (context, index) {
                            final item = valor[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                width: 60,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.network(
                                        item["image"],
                                        height: 190,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),

                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item["nome"],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),

                                          SizedBox(height: 8),

                                          Text(
                                            "R\$ ${item["preco"]}/unid",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black54,
                                            ),
                                          ),

                                          SizedBox(height: 12),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [

                                              GestureDetector(
                                                child:  Container(
                                                width: 36,
                                                height: 36,
                                                decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "+",
                                                    style: TextStyle(
                                                      fontSize: 22,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                PostCarrinho(item);
                                              },
                                              )
                                             
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
