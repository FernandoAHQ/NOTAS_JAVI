import 'package:flutter/material.dart';
import 'package:x/models/nota_model.dart';
import 'package:x/screens/nueva_nota_screen.dart';
import 'package:x/widgets/nota.dart';

import 'data/users_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    void aumentarNotas(NotaModel nota) {
      setState(() {
        notas.add(NotaModel(titulo: nota.titulo, cuerpo: nota.cuerpo));
      });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'KoderApp: NOTAS ELABORADAS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: /*aumentarNotas,*/ () async {
          final notaCreada = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NuevaNota()),
          );
          if (notaCreada == null) {
            
          }
          else{
          aumentarNotas(notaCreada);
          }
        },
        child: const Icon(Icons.note_add),
        tooltip: 'Agregar Nota',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemBuilder: (context, index) {
              print(index);
              return Nota(nota: notas[index]);
            },
            itemCount: notas.length,
          ),
        ),
      ),
    );
  }
}
