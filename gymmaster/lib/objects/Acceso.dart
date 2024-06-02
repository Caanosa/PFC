import 'dart:convert';
//Este método convierte un json en objeto de la clase Acceso
Acceso accesoFromJson(String str) => Acceso.fromJson(json.decode(str));
//Este método convierte un objeto de la clase Acceso a json
String accesoToJson(Acceso data) => json.encode(data.toJson());
//Clase Acceso
class Acceso {
  //Atributos
  String nombreUsuario;
  String claveAcceso;
  //Constructor
  Acceso({
    required this.nombreUsuario,
    required this.claveAcceso,
  });
  //Este método permite construir un objeto de la clase Acceso haciendo uso del json
  factory Acceso.fromJson(Map<String, dynamic> json) => Acceso(
        nombreUsuario: json["nombreUsuario"],
        claveAcceso: json["claveAcceso"],
      );
  //Este método convierte un objeto de la clase Acceso a un mapa el cuál se convertirá en un json
  Map<String, dynamic> toJson() => {
        "nombreUsuario": nombreUsuario,
        "claveAcceso": claveAcceso,
      };
}
