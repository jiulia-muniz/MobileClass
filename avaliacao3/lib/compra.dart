import 'package:flutter/material.dart';

class CompraTela extends StatelessWidget {
  const CompraTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 220,
          centerTitle: true,
          title: Image.asset("assets/images/whitee.png", height: 200),
        ),

      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset("assets/images/bg.png", fit: BoxFit.cover),
          ),

          Center(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Text(
                "Compra finalizada com sucesso!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
