import 'dart:convert';
//Este método convierte un json en objeto de la clase Usuario
Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));
//Este método convierte un objeto de la clase Usuario a json
String usuarioToJson(Usuario data) => json.encode(data.toJson());
//Clase usuario
class Usuario {
  //Atributos
  int usuarioId;
  String nombreUsuario = "";
  String passwordUsuario = "";
  int nivel = 0;
  int xp = 0;
  //Constructor
  Usuario({
    required this.usuarioId,
    required this.nombreUsuario,
    required this.passwordUsuario,
    required this.nivel,
    required this.xp,

  });
  //Este método permite construir un objeto de la clase Usuario haciendo uso del json
  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        usuarioId: json["usuarioId"],
        nombreUsuario: json["nombreUsuario"],
        passwordUsuario: json["passwordUsuario"],
        nivel: json["nivel"],
        xp: json["xp"],
      );
  //Este método convierte un objeto de la clase Usuario a un mapa el cuál se convertirá en un json
  Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "nombreUsuario": nombreUsuario,
        "passwordUsuario": passwordUsuario,
        "nivel": nivel,
        "xp": xp,
      };
}
