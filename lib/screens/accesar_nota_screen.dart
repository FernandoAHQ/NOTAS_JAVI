import 'package:flutter/material.dart';

import '../models/nota_model.dart';

class AbrirNota extends StatelessWidget {
  const AbrirNota({super.key, required this.nota});

  final NotaModel nota;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            nota.titulo,
          ),
          actions: []),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                nota.titulo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 5.0,
                  fontSize: 28.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Text(
                nota.cuerpo,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
