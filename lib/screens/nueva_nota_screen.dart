import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/users_data.dart';
import '../models/nota_model.dart';

class NuevaNota extends StatefulWidget {
  const NuevaNota({super.key});

  @override
  State<NuevaNota> createState() => _NuevaNotaState();
}

class _NuevaNotaState extends State<NuevaNota> {
  final _formKey = GlobalKey<FormState>();

  late String _textoCuerpo;
  late String _textoTitulo;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Nueva Nota',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                    letterSpacing: 10,
                  ),
                ),
                const SizedBox(
                  height: 28.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: 'Titulo de la nota', icon: Icon(Icons.note)),
                  validator: (valor) {
                    if (valor!.length <= 3 || valor == null || valor.isEmpty) {
                      return 'No son validos textos menores a 3';
                    }
                    _textoTitulo = valor;
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Cuerpo de la nota',
                  ),
                  minLines: 4,
                  maxLines: null,
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'No son validos textos vacios';
                    }
                    _textoCuerpo = valor;
                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(
                            context,
                            NotaModel(
                                titulo: _textoTitulo, cuerpo: _textoCuerpo));
                      }
                    },
                    child: const Text('guardar'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
