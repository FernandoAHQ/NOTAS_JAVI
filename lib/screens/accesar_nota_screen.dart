import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        padding: EdgeInsets.all(30.0),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              nota.titulo,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 5.0,
                fontSize: 28.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              nota.cuerpo,
              style: TextStyle(
                fontSize: 14.0,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
