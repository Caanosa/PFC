// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:gymmaster/objects/ApiRequest.dart';
import 'package:gymmaster/objects/Variable.dart';
import 'package:gymmaster/objects/usuario.dart';

class RegistroState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Registro();
}

class Registro extends State<RegistroState> {
  final keyForm = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  String nombreUsuario = "";
  String correo = ""; // Variable no utilizada
  String passwordUsuario = "";

  @override
  Widget build(BuildContext context) {
    Usuario? usuario; // Variable no utilizada
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Registro"),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Stack(
        children: [
          // Imagen de fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagenes/fondos/fondo_login.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Formulario de registro
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Form(
                key: keyForm,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 60),
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: "Ingresa tu nombre de usuario",
                        labelText: "Nombre Usuario",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio";
                        }
                        nombreUsuario = value; // Actualiza el nombre de usuario
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: "Ingresa tu contraseña",
                        labelText: "Contraseña",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio";
                        }
                        if (value.length < 12) {
                          return "La contraseña debe ser de 12 caracteres o más";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Confirma tu contraseña",
                        labelText: "Confirmar Contraseña",
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.black.withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Campo obligatorio";
                        }
                        if (value != passwordController.text) {
                          return "Las contraseñas son distintas";
                        }
                        passwordUsuario = value; // Actualiza la contraseña confirmada
                        return null;
                      },
                      obscureText: true,
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () async {
                        // Obtener nombre de usuario y contraseña desde los controladores
                        String nombreUsuario = usernameController.text;
                        String passwordUsuario = passwordController.text;

                        // Actualizar la variable global de usuario (Variable.usuario)
                        Variable.usuario.nombreUsuario = nombreUsuario;
                        Variable.usuario.passwordUsuario = passwordUsuario;

                        // Llamar al API de registro
                        Usuario? usuarioRegistrado = await ApiService.registrarse(Variable.usuario);

                        // Actualizar la variable global de usuario nuevamente
                        Variable.usuario = usuarioRegistrado ?? Usuario(
                          usuarioId: 0,
                          nombreUsuario: "",
                          passwordUsuario: "",
                          nivel: 1,
                          xp: 0,
                        );

                        // Verificar si el registro fue exitoso
                        if (usuarioRegistrado != null) {
                          // Validar los datos del formulario
                          if (keyForm.currentState!.validate()) {
                            // Navegar a la página de inicio de sesión
                            cambiarPagina(
                              context,
                              usuarioRegistrado.nombreUsuario,
                              usuarioRegistrado.passwordUsuario,
                            );
                          } else {
                            print("Formulario incorrecto");
                          }
                        } else {
                          print("Error en el registro del usuario");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFCC9900), // Amarillo oscuro
                        foregroundColor: Colors.white, // Texto blanco
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Registrarse"),
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

  void cambiarPagina(BuildContext context, String nombreUsuario, String passwordUsuario) {
    // Navegar a la página de inicio de sesión con las credenciales del usuario
    Navigator.of(context).pushNamed(
      "/login",
      arguments: Usuario(
        usuarioId: 1,
        nombreUsuario: nombreUsuario,
        passwordUsuario: passwordUsuario,
        nivel: 0,
        xp: 0,
      ),
    );
  }
}