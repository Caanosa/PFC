// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gymmaster/objects/Variable.dart';
import 'package:gymmaster/pages/BordeContenedorPerfil.dart';
import 'package:gymmaster/pages/XPBar.dart';

class TrapezoidContainer extends StatelessWidget {
  // Propiedades finales (inmutables) de la clase.
  final double width;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final int currentXP;
  final int maxXP;
  final double progress;

  // Constructor de la clase que inicializa todas las propiedades requeridas.
  TrapezoidContainer({
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
    required this.currentXP,
    required this.maxXP,
    required this.progress,
  });

  // Método build que define el contenido visual del widget.
  @override
  Widget build(BuildContext context) {
    return Container(
      // Establece el ancho y alto del contenedor.
      width: width,
      height: height,
      // Usa CustomPaint para dibujar el contenedor con un pintor personalizado.
      child: CustomPaint(
        size: Size(width, height),
        painter: TrapezoidPainter(
          backgroundColor: backgroundColor,
          borderColor: borderColor,
          borderWidth: borderWidth,
        ),
        // Utiliza un Stack para superponer widgets.
        child: Stack(
          children: [
            // Posiciona un contenedor dentro del stack.
            Positioned(
              left: 100,
              child: Container(
                width: 156,
                height: 58,
                child: Column(
                  // Coloca los widgets en una columna.
                  children: [
                    // Contenedor que muestra la experiencia actual y máxima.
                    Container(
                      margin: EdgeInsets.only(top: 18, left: 20),
                      width: 100,
                      height: 24,
                      child: Text(
                        "$currentXP/$maxXP",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    // Contenedor que muestra una barra de progreso personalizada.
                    Container(
                      margin: EdgeInsets.only(left: 38),
                      width: 156,
                      height: 12,
                      child: CustomProgressBar(
                        progress: progress,
                        width: 160,
                        height: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Posiciona otro contenedor dentro del stack.
            Positioned(
              right: 7,
              bottom: 0,
              child: Container(
                height: 52,
                // Columna que alinea sus elementos al final.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Contenedor que muestra el nombre del usuario.
                    Container(
                      width: 85,
                      height: 27,
                      child: Text(
                        Variable.usuario.nombreUsuario,
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Contenedor que muestra el nivel del usuario.
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 40,
                      child: Text(
                        "lv:" + Variable.usuario.nivel.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
