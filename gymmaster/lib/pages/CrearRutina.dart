// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gymmaster/objects/RutinaManager.dart';
import 'package:gymmaster/pages/MenuRutina.dart';

class CrearRutinaScreen extends StatefulWidget {
  @override
  _CrearRutinaScreenState createState() => _CrearRutinaScreenState();
}

class _CrearRutinaScreenState extends State<CrearRutinaScreen> {
  // Lista que contiene las rutinas guardadas, obtenidas del RutinaManager
  List<Rutina> rutinasGuardadas = RutinaManager().getRutinas();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          fondoPantalla(),         // Fondo de pantalla personalizado
          appBarPersonalizada(),   // AppBar personalizada en la parte superior
          ListView(
            children: [
              SizedBox(height: 80), // Espacio en blanco al principio de la lista
              // Generar elementos de lista para cada rutina guardada y un botón para añadir nueva rutina
              for (var rutina in rutinasGuardadas) _buildItem(context, rutina),
              _buildItem(context, null), // Botón para añadir una nueva rutina
            ],
          ),
        ],
      ),
    );
  }

  // Widget para el fondo de pantalla
  Widget fondoPantalla() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imagenes/fondos/fondo_rutina.png'), // Imagen de fondo
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Widget para la AppBar personalizada
  Widget appBarPersonalizada() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.transparent, // Fondo transparente para la AppBar
        elevation: 0, // Sin sombra debajo de la AppBar
        title: Text(
          'Crear Rutina', // Título de la AppBar
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  // Widget para construir cada elemento de la lista de rutinas
  Widget _buildItem(BuildContext context, Rutina? rutina) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: GestureDetector(
        onTap: () {
          if (rutina == null) {
            // Navegar al menú de días de la semana para crear una nueva rutina
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MenuRutinasScreen(), // Pantalla para crear una nueva rutina
              ),
            ).then((_) {
              // Actualizar la lista de rutinas guardadas cuando se regresa desde el menú de rutinas
              setState(() {
                rutinasGuardadas = RutinaManager().getRutinas();
              });
            });
          } else {
            // Mostrar detalles de la rutina guardada
          }
        },
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: rutina == null ? Colors.grey[300] : Colors.white, // Color del contenedor según si es una nueva rutina o una guardada
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: rutina == null
                ? Icon(Icons.add, size: 48) // Icono de más para añadir nueva rutina
                : Text(
                    rutina.nombre, // Nombre de la rutina guardada
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}