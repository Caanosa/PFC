// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  // Propiedades finales (inmutables) de la clase.
  final double progress;
  final double width;
  final double height;
  final Color fillColor;
  final Color borderColor;

  // Constructor de la clase que inicializa todas las propiedades requeridas.
  // fillColor y borderColor tienen valores por defecto.
  CustomProgressBar({
    required this.progress,
    required this.width,
    required this.height,
    this.fillColor = const Color.fromARGB(255, 190, 165, 0), // Color por defecto amarillo dorado
    this.borderColor = const Color.fromARGB(255, 255, 255, 255), // Color por defecto blanco
  });

  // Método build que define el contenido visual del widget.
  @override
  Widget build(BuildContext context) {
    // Calcula el ancho de la barra llena basado en el progreso.
    double filledWidth = width * (progress / 100);
    return Container(
      // Establece el ancho y alto del contenedor.
      width: width,
      height: height,
      // Decora el contenedor con bordes redondeados y un borde.
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
        border: Border.all(color: borderColor), // Borde del contenedor
      ),
      // Usa un Stack para superponer el relleno de la barra sobre el fondo.
      child: Stack(
        children: [
          // Contenedor interno que representa la parte llena de la barra de progreso.
          Container(
            width: filledWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0), // Bordes redondeados del relleno
              color: fillColor, // Color del relleno
            ),
          ),
        ],
      ),
    );
  }
}