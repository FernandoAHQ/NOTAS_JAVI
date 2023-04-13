import '../models/account_model.dart';

List<CuentaModel> cuentas = [
  CuentaModel(usuario: 'Javier Pech', 
  contrasena: '123456789',
  correo: 'davidpech161@gmail.com'
  ),
   CuentaModel(usuario: 'Raul', 
  contrasena: 'abcdefghi',
  correo: 'omar_niño_de_dios21@gmail.com',
  ),
];

bool obtenerDatosDeUsuario(String identificador, String contrasena){
  
  for (var element in cuentas) {
    if ((identificador == element.usuario || identificador == element.correo) && contrasena == element.contrasena) {
      return true;
    }
  }
  return false;
}