import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gymmaster/pages/Login.dart';
import 'package:gymmaster/pages/PantallaInicio.dart';
import 'package:gymmaster/pages/Registro.dart';
import 'package:gymmaster/pages/Escena1.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLogedIn = await obtenerIsLogedIn();
  runApp(MyApp(isLogedIn: isLogedIn));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
}

Future<bool> obtenerIsLogedIn() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLogedIn') ?? false;
}


//clase que se utiliza par llamar al resto de paginas
class MyApp extends StatelessWidget {

  final bool isLogedIn;

  MyApp({required this.isLogedIn});
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "MyApp",
      //estalecemos la ruta principal
      initialRoute: "/pantalla1",
      debugShowCheckedModeBanner: false,
      //localizamos el resto de rutas
      routes: {
        "/pantalla1": (BuildContext context) => Escena1(isLogedIn: isLogedIn),
        "/login": (BuildContext context) => LoginState(),
        "/registro": (BuildContext context) => RegistroState(),
        "/Principal":(BuildContext context) => PantallaInicio(),
      },
    );
  }
}