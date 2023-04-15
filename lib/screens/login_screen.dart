import 'package:flutter/material.dart';
import 'package:x/data/users_account_data.dart';

import '../models/account_model.dart';
import '../otro.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  bool _validado = false;
  bool _intentoIncorrecto = false;

  String _usuario = '';
  String _contrasena = '';

  late CuentaModel _datosDeInicio;

  _obtenerDatos () {
    for( CuentaModel x in cuentas){
      if((_datosDeInicio.usuario == x.usuario || _datosDeInicio.correo == x.correo)&& _datosDeInicio.contrasena == x.contrasena){
        return true;
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login '),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey, 
            child: Column(
                    children: [
                      Container(
                        height: 150.0,
                        width: 190.0,
                        padding: const EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                        ),
                        child: Center(
                          child: Image.asset('assets/images/gatito.jpeg'),
                        ),
                      ),
                      Container(
                        height: 40.0,
                        alignment: Alignment.center,
                        child: _intentoIncorrecto == true 
                        ? const Text(
                          'Datos Incorrectos',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        )
                        : const Text(
                          ''
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Usuario',
                            hintText: 'Ingrese un correo valido'
                          ),
                          validator: (valor){
                            if(valor!.length < 5){
                              return 'El usuario no puede ser menor a 4 dígitos';
                            }
                            _usuario = valor;
                            print(_usuario);
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Contraseña',
                            hintText: 'Ingrese su contraseña'
                          ),
                          autocorrect: false,
                          validator: (valor){
                            if(valor!.length < 9 || valor.isEmpty){
                              return 'La contraseña no puede ser menor a 9 dígitos';
                            }
                            _contrasena = valor;
                            print(_contrasena);
                            return null;
                          },
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 250,
                        decoration: BoxDecoration(
                            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                                print(_contrasena);
                                print(_usuario);
                                print('///-/-/--//-');
                                _datosDeInicio = CuentaModel(usuario: _usuario, contrasena: _contrasena, correo: _usuario);
                                print(_datosDeInicio.contrasena);
                                print(_datosDeInicio.correo);
                                print(_datosDeInicio.usuario);
                                _validado = _obtenerDatos();
                                if(_validado == false ){
                                  _intentoIncorrecto = true;
                                }
                                else{
                                  Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Flutter Demo Home Page'))); 
                                }
                              }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ]),
    );
  }
}