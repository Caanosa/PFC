
import 'package:flutter/material.dart';

class TrapezoidPainter extends CustomPainter {
  // Propiedades finales (inmutables) de la clase.
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;

  // Constructor de la clase que inicializa todas las propiedades requeridas.
  TrapezoidPainter({
    required this.backgroundColor,
    required this.borderColor,
    required this.borderWidth,
  });

  // Método paint que define cómo se debe pintar en el canvas.
  @override
  void paint(Canvas canvas, Size size) {
    // Define la pintura para el fondo.
    Paint backgroundPaint = Paint()..color = backgroundColor;
    // Define la pintura para el borde.
    Paint borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    // Define el camino para el fondo en forma de trapecio.
    Path path = Path();
    path.moveTo(size.width, 0); // Mover a la esquina superior derecha.
    path.lineTo(size.width, size.height); // Línea hasta la esquina inferior derecha.
    path.lineTo(size.width * 0.45, size.height); // Línea hasta la esquina inferior izquierda desplazada.
    path.lineTo(size.width * 0.2, 0); // Línea hasta la esquina superior izquierda desplazada.
    path.close(); // Cierra el camino.

    // Dibuja el fondo en el canvas.
    canvas.drawPath(path, backgroundPaint);

    // Define el camino para el borde en forma de trapecio.
    Path borderPath = Path();
    borderPath.moveTo(size.width, size.height); // Empieza en la esquina inferior derecha.
    borderPath.lineTo(size.width * 0.45, size.height); // Línea hasta la esquina inferior izquierda desplazada.
    borderPath.lineTo(size.width * 0.2, 0); // Línea hasta la esquina superior izquierda desplazada.
    // Dibuja el borde en el canvas.
    canvas.drawPath(borderPath, borderPaint);
  }

  // Método que determina si se debe repintar el canvas cuando el estado cambia.
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}