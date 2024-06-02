// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:gymmaster/pages/Coleccion.dart';
import 'package:gymmaster/pages/CrearRutina.dart';
import 'package:gymmaster/pages/Ejercicios.dart';
import 'package:gymmaster/pages/Inicio.dart';
import 'package:gymmaster/pages/MiRutina.dart';

class PantallaInicio extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InicioScreen();
}

class InicioScreen extends State<PantallaInicio> {
  int _selectedIndex = 0; // Índice de la pantalla seleccionada
  static const TextStyle optionStyle = TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold); // Estilo de texto para las opciones
  static List<Widget> _widgetOptions = <Widget>[
    // Lista de pantallas disponibles
    Inicio(), // Pantalla de inicio
    CrearRutinaScreen(), // Pantalla para crear rutinas
    ContainerSwitcher(), // Widget para alternar entre contenedores
    Ejercicios(), // Pantalla de ejercicios
    ColeccionScreen(), // Pantalla de colección
    Text(
      'Actualización pendiente...',
      style: optionStyle,
    ),
    Text(
      'Actualización pendiente...',
      style: optionStyle,
    ),
  ];

  // Función para manejar el cambio de pantalla al hacer clic en un ítem del menú
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Actualiza el índice seleccionado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Fondo de pantalla
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/imagenes/fondos/fondo_provisional.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Stack(
              children: [
                _widgetOptions[
                    _selectedIndex], // Pantalla seleccionada según el índice
              ],
            ),
          ),
          // AppBar transparente
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
        ],
      ),
      // Drawer (menú lateral)
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/imagenes/fondos/fondo_1_3.png'), // Fondo del drawer
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              // Encabezado del menú
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'MENU',
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromARGB(255, 255, 221, 0),
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              // Lista de opciones del menú
              _buildListTile(title: 'Inicio', index: 0),
              _buildListTile(title: 'Crear Rutina', index: 1),
              _buildListTile(title: 'Mi Rutina', index: 2),
              _buildListTile(title: 'Ejercicios', index: 3),
              _buildListTile(title: 'Coleccion', index: 4),
              _buildListTile(title: 'Tienda', index: 5),
              _buildListTile(title: 'Personalizar', index: 6),
            ],
          ),
        ),
      ),
    );
  }

  // Widget para construir cada ítem del menú lateral (ListTile)
  Widget _buildListTile({required String title, required int index}) {
    bool isSelected =
        _selectedIndex == index; // Verifica si el ítem está seleccionado
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5)
            : Colors.transparent,
        border: isSelected
            ? Border.all(
                color: const Color.fromARGB(255, 255, 221, 0), width: 1)
            : null,
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(255, 255, 221, 0),
            fontFamily: 'Helvetica',
          ),
        ),
        onTap: () {
          _onItemTapped(index); // Maneja el tap en el ítem del menú
          Navigator.pop(context); // Cierra el drawer después de la selección
        },
      ),
    );
  }
}
