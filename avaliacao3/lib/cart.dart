import 'package:avaliacao3/compra.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<QueryDocumentSnapshot<Map<String, dynamic>>> produtos = [];
  Map<String, int> quantidade = {};

  @override
  void initState() {
    super.initState();
    carregarProdutos();
  }

  void carregarProdutos() {
    FirebaseFirestore.instance.collection("carrinho").snapshots().listen((
      snapshot,
    ) {
      setState(() {
        produtos = snapshot.docs;

        quantidade.clear();

        for (var doc in produtos) {
          final item = doc.data();
          final nome = item["produto"]["nome"];
          quantidade[nome] = item["quantidade"] ?? 1;
        }
      });
    });
  }

  double calcularTotal() {
    double total = 0;

    for (var doc in produtos) {
      final item = doc.data();
      final nome = item["produto"]["nome"];
      final preco = item["produto"]["preco"];
      final qnt = quantidade[nome] ?? 1;

      total += preco * qnt;
    }

    return total;
  }

  void deletarItem(String id) async {
    await FirebaseFirestore.instance.collection("carrinho").doc(id).delete();
  }

  Future<void> finalizarCompra() async {
    if (produtos.isEmpty) return;

    final totalCompra = calcularTotal();

    // Monta lista de itens comprados
    List<Map<String, dynamic>> itens = produtos.map((doc) {
      final item = doc.data();
      final nome = item["produto"]["nome"];
      final preco = item["produto"]["preco"];
      final imagem = item["produto"]["image"];
      final qnt = quantidade[nome] ?? 1;

      return {"nome": nome, "preco": preco, "quantidade": qnt, "image": imagem};
    }).toList();

    // Salvar compra no Firebase
    await FirebaseFirestore.instance.collection("compras").add({
      "itens": itens,
      "total": totalCompra,
      "data": DateTime.now(),
    });

    // Limpar carrinho
    for (var doc in produtos) {
      await FirebaseFirestore.instance
          .collection("carrinho")
          .doc(doc.id)
          .delete();
    }

    // Ir para tela de compra finalizada
    Navigator.push(context, MaterialPageRoute(builder: (_) => CompraTela()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          ),

          produtos.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    SizedBox(height: 40),

                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(16),
                        itemCount: produtos.length,
                        itemBuilder: (context, index) {
                          final doc = produtos[index];
                          final item = doc.data();
                          final nome = item["produto"]["nome"];
                          final preco = item["produto"]["preco"];
                          final imagem = item["produto"]["image"];
                          final qnt = quantidade[nome] ?? 1;

                          return Container(
                            margin: EdgeInsets.only(bottom: 16),
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
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    bottomLeft: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    imagem,
                                    width: 90,
                                    height: 90,
                                    fit: BoxFit.cover,
                                  ),
                                ),

                                SizedBox(width: 12),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        nome,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "R\$ $preco / unid",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                // QUANTIDADE
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          if (quantidade[nome]! > 1) {
                                            quantidade[nome] =
                                                quantidade[nome]! - 1;
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.orange,
                                      ),
                                    ),

                                    Text(
                                      qnt.toString().padLeft(2, "0"),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantidade[nome] =
                                              quantidade[nome]! + 1;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ],
                                ),

                                // 🗑 ÍCONE DE DELETE
                                IconButton(
                                  onPressed: () {
                                    deletarItem(doc.id);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.orange,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // TOTAL
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "R\$ ${calcularTotal().toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: finalizarCompra,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                foregroundColor: Colors.white,
                                minimumSize: Size(200, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text(
                                "Finalizar Compra",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
