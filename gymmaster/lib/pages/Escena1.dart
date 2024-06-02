// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Escena1 extends StatefulWidget {
  final bool isLogedIn;

  Escena1({required this.isLogedIn});

  @override
  State<StatefulWidget> createState() => Escena1Escena(isLogedIn: isLogedIn);
}

class Escena1Escena extends State<Escena1> with WidgetsBindingObserver {
  final bool isLogedIn;

  Escena1Escena({required this.isLogedIn});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); // Observador de cambios de ciclo de vida de la aplicación
  }

  @override
  void dispose() {
    print("------------------0"); // Mensaje de depuración para indicar inicio de disposición del widget
    WidgetsBinding.instance.removeObserver(this); // Remueve el observador de cambios de ciclo de vida
    print("------------------1"); // Mensaje de depuración para indicar remoción del observador
    super.dispose(); // Llama al método de disposición del widget
    print("------------------2"); // Mensaje de depuración para indicar finalización de disposición del widget
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InkWell(
            child: Container(
              height: MediaQuery.of(context).size.height * 1,
              width: MediaQuery.of(context).size.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/imagenes/fondos/pantalla1.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            onTap: () {
              mostrarSegundaV(context); // Método para mostrar la segunda pantalla al hacer tap en el fondo
            },
          ),
        ],
      ),
    );
  }

  void mostrarSegundaV(BuildContext context) {
    Navigator.of(context).pushNamed("/login"); // Navega a la pantalla de login al hacer tap en el fondo
  }

  void cambiarPagina(BuildContext context) {
    Navigator.of(context).pushNamed("/login"); // Método alternativo para navegar a la pantalla de login
  }
}