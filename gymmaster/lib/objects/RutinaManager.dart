class Rutina {
  final String nombre;
  final Map<String, List<String>> rutinas;

  Rutina({required this.nombre, required this.rutinas});
}

class RutinaManager {
  static final RutinaManager _singleton = RutinaManager._internal();
  List<Rutina> rutinasGuardadas = [];

  factory RutinaManager() {
    return _singleton;
  }

  RutinaManager._internal();

  void addRutina(Rutina rutina) {
    rutinasGuardadas.add(rutina);
  }

  List<Rutina> getRutinas() {
    return rutinasGuardadas;
  }

  Rutina getRutinaByIndex(int index) {
    return rutinasGuardadas[index];
  }
}