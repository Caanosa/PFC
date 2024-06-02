//Clase que contiene los métodos necesarios para conectarse a la API
// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'dart:convert';
import 'package:gymmaster/objects/Acceso.dart';
import 'package:gymmaster/objects/usuario.dart';
import 'package:http/http.dart' as http;

class ApiService {
  //URL base de la API
  static const String baseUrl = 'http://10.0.2.2:8080/api';
  //Este método permite crear un usuario
  static Future<int> crearUsuario(Usuario usuario) async {
    String url = '$baseUrl/registrarse';
    int statusCode = 0;
    //En esta variable se almacena el usuario que se pasa por parámetro convertido en json
    String jsonBody = json.encode(usuario.toJson());

    try {
      //Se realiza la petición post a la api
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );
      //Se guarda el código de respuesta
      statusCode = response.statusCode;
      //Se verifica si el código de respuesta es el 200
      if (statusCode == 200) {
        print('Usuario creado exitosamente.');
      } else {
        print('Error al crear usuario: $statusCode $jsonBody');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
    //Se devuelve el código de respuesta
    return statusCode;
  }

  //Este método permite verificar si los datos de inicio de sesión son correctos
  static Future<Usuario> iniciarSesion(Acceso acceso) async {
    String url = '$baseUrl/iniciar-sesion';
    int statusCode = 0;
    String jsonBody = json.encode(acceso.toJson());

    try {
      //Se realiza la petición post al endpoint
      http.Response response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );
      statusCode = response.statusCode;
      // Se verifica que el código de respuesta sea 200 (OK)
      if (response.statusCode == 200) {
        // Convertir la respuesta en un objeto Acceso
        Usuario accesoResponse = Usuario.fromJson(json.decode(response.body));
        print('Inicio de sesión exitoso.');
        return accesoResponse;
      } else {
        // Manejar el caso de error
        print(
            'Error al iniciar sesión: ${response.statusCode} ${response.body}');
        throw Exception('Error al iniciar sesión: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
      return new Usuario(
          usuarioId: 0,
          nombreUsuario: "",
          passwordUsuario: "",
          nivel: 0,
          xp: 0);
    }
  }

// Método estático que intenta registrar un nuevo usuario y, si tiene éxito, inicia sesión automáticamente.
  static Future<Usuario?> registrarse(Usuario usuario) async {
    // Llama a la función crearUsuario y espera el resultado, que es un código de estado.
    int statusCode = await crearUsuario(usuario);

    // Si el código de estado es 200, el registro fue exitoso.
    if (statusCode == 200) {
      // Crea una instancia de Acceso con el nombre de usuario y la contraseña del usuario registrado.
      Acceso acceso = Acceso(
        nombreUsuario: usuario.nombreUsuario,
        claveAcceso: usuario.passwordUsuario,
      );

      // Llama a la función iniciarSesion con las credenciales de acceso y espera el resultado, que es un usuario logueado.
      Usuario? usuarioLogueado = await iniciarSesion(acceso);

      // Si el inicio de sesión fue exitoso, imprime un mensaje de éxito y retorna el usuario logueado.
      if (usuarioLogueado != null) {
        print('Registro e inicio de sesión exitosos.');
        return usuarioLogueado;
      } else {
        // Si el inicio de sesión falló, imprime un mensaje de error y retorna null.
        print('Registro exitoso, pero error al iniciar sesión.');
        return null;
      }
    } else {
      // Si el registro falló, imprime un mensaje de error con el código de estado y retorna null.
      print('Error en el registro: $statusCode');
      return null;
    }
  }

  // Este método permite obtener los detalles de un usuario por su nombre de usuario
  static Future<Usuario?> obtenerUsuario(String nombreUsuario) async {
    String url = '$baseUrl/usuarios/$nombreUsuario';

    try {
      http.Response response =
          await http.get(Uri.parse(url), headers: <String, String>{
        'Content-Type': 'application/json',
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        return Usuario.fromJson(data);
      } else {
        print('Error al obtener usuario: ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
    return null;
  }
}
