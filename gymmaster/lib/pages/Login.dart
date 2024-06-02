// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:gymmaster/objects/Acceso.dart';
import 'package:gymmaster/objects/ApiRequest.dart';
import 'package:gymmaster/objects/Variable.dart';
import 'package:gymmaster/objects/usuario.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Login();
}

class Login extends State<LoginState> {
  final keyForm = GlobalKey<FormState>(); // Clave global para el formulario
  TextEditingController usernameController =
      TextEditingController(); // Controlador para el campo de nombre de usuario
  TextEditingController passwordController =
      TextEditingController(); // Controlador para el campo de contraseña

  @override
  Widget build(BuildContext context) {
    Usuario? usuario; // Variable para almacenar el usuario

    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla de inicio de sesión
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/imagenes/fondos/fondo_login.png'), // Imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Formulario de inicio de sesión centrado en la parte superior
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Form(
                key:
                    keyForm, // Asigna la clave global al formulario para validación y manipulación
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 30), // Espacio entre elementos
                    // Campo de texto para el nombre de usuario
                    TextFormField(
                      controller:
                          usernameController, // Asigna el controlador para el campo de nombre de usuario
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio"; // Validación: campo no puede estar vacío
                        }
                        if (value != usuario?.nombreUsuario) {
                          return "Nombre de Usuario incorrecto"; // Validación: nombre de usuario no coincide con el registrado
                        }
                        return null; // Validación correcta
                      },
                      keyboardType:
                          TextInputType.name, // Tipo de teclado: texto
                      decoration: InputDecoration(
                        hintText:
                            "Ingresa tu nombre de usuario", // Texto de ayuda dentro del campo
                        labelText: "Nombre de Usuario", // Etiqueta del campo
                        labelStyle: TextStyle(
                            color: Colors.white), // Estilo de la etiqueta
                        filled: true,
                        fillColor: Colors.black
                            .withOpacity(0.5), // Color de fondo del campo
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Borde redondeado del campo
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white54), // Estilo del texto de ayuda
                      ),
                      style: TextStyle(
                          color: Colors.white), // Estilo del texto ingresado
                    ),
                    SizedBox(height: 20), // Espacio entre elementos
                    // Campo de texto para la contraseña
                    TextFormField(
                      controller:
                          passwordController, // Asigna el controlador para el campo de contraseña
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio"; // Validación: campo no puede estar vacío
                        }
                        if (value != usuario?.passwordUsuario) {
                          return "Contraseña incorrecta"; // Validación: contraseña no coincide con la registrada
                        }
                        return null; // Validación correcta
                      },
                      obscureText: true, // Texto oculto para la contraseña
                      decoration: InputDecoration(
                        hintText:
                            "Ingresa tu contraseña", // Texto de ayuda dentro del campo
                        labelText: "Contraseña", // Etiqueta del campo
                        labelStyle: TextStyle(
                            color: Colors.white), // Estilo de la etiqueta
                        filled: true,
                        fillColor: Colors.black
                            .withOpacity(0.5), // Color de fondo del campo
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Borde redondeado del campo
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white54), // Estilo del texto de ayuda
                      ),
                      style: TextStyle(
                          color: Colors.white), // Estilo del texto ingresado
                    ),
                    SizedBox(height: 40), // Espacio entre elementos
                    // Botones de inicio de sesión y registro
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Botón de inicio de sesión
                        ElevatedButton(
                          onPressed: () async {
                            // Inicia sesión y obtiene el usuario desde el API
                            usuario = await ApiService.iniciarSesion(
                              Acceso(
                                nombreUsuario: usernameController.text,
                                claveAcceso: passwordController.text,
                              ),
                            );
                            // Asigna el usuario obtenido o crea uno nuevo si es nulo
                            Variable.usuario = usuario ??
                                Usuario(
                                    usuarioId: 0,
                                    nombreUsuario: "",
                                    passwordUsuario: "",
                                    nivel: 1,
                                    xp: 0);
                            // Valida el formulario antes de proceder
                            if (keyForm.currentState!.validate()) {
                              guardarIsLogedInEnSharedPreferences(
                                  true); // Guarda el estado de inicio de sesión en SharedPreferences
                              cambiarPaginaApli(
                                  context); // Navega a la página principal de la aplicación
                            } else {
                              print(
                                  "Validación incorrecta"); // Mensaje de error si la validación falla
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFCC9900), // Amarillo oscuro
                            foregroundColor: const Color.fromARGB(
                                255, 0, 0, 0), // Texto negro
                            padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15), // Padding del botón
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Borde redondeado del botón
                            ),
                          ),
                          child: Text(
                              "Iniciar Sesión"), // Texto del botón de inicio de sesión
                        ),
                        // Botón de registro
                        ElevatedButton(
                          onPressed: () {
                            cambiarPagina(
                                context); // Navega a la página de registro al presionar el botón
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xFFCC9900), // Amarillo oscuro
                            foregroundColor: const Color.fromARGB(
                                255, 0, 0, 0), // Texto negro
                            padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15), // Padding del botón
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Borde redondeado del botón
                            ),
                          ),
                          child: Text(
                              "Registrarse"), // Texto del botón de registro
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Función para navegar a la página de registro
  cambiarPagina(BuildContext context) {
    Navigator.of(context).pushNamed("/registro");
  }

  // Función para navegar a la página principal de la aplicación
  cambiarPaginaApli(BuildContext context) {
    Navigator.of(context).pushNamed("/Principal");
  }

  // Función para guardar el estado de inicio de sesión en SharedPreferences
  void guardarIsLogedInEnSharedPreferences(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLogedIn', value);
  }
}
