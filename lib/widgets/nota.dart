import 'package:flutter/material.dart';
import 'package:x/models/nota_model.dart';
import 'package:x/screens/accesar_nota_screen.dart';

class Nota extends StatelessWidget {
  const Nota({super.key, required this.nota});

  final NotaModel nota;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('' + nota.titulo);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AbrirNota(
                    nota: nota,
                  )),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(
            nota.titulo,
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
          subtitle: Text(
            nota.cuerpo,
            maxLines: 2,
            overflow: TextOverflow.fade,
          ),
        ),
      ),
    );
  }
}
