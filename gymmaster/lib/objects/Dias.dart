import 'package:gymmaster/objects/DescripcionEjercicio.dart';

class Dia {
  int id_dia;
  String nombre_dia = "";
  List<DescripcionEjercicios> ejercicios;

  Dia(
    this.id_dia,
    this.nombre_dia,
    this.ejercicios
  );
}