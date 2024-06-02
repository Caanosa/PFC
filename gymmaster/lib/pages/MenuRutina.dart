import 'package:flutter/material.dart';
import 'package:gymmaster/objects/RutinaManager.dart';
import 'package:gymmaster/pages/DetalleRutina.dart';

class MenuRutinasScreen extends StatelessWidget {
  final Map<String, List<String>> rutinas = {
    'Lunes': [],
    'Martes': [],
    'Miércoles': [],
    'Jueves': [],
    'Viernes': [],
    'Sábado': [],
    'Domingo': [],
  };

  // Función para construir el botón para un día específico
  Widget _buildDayButton(BuildContext context, String day) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
        child: ElevatedButton(
          onPressed: () {
            // Navegar a la pantalla de detalle de rutina al presionar el botón
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    DetalleRutinaScreen(day: day, rutinas: rutinas),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(
                187, 0, 0, 0), // Fondo del botón con transparencia
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(8), // Borde redondeado del botón
              side: BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255)), // Borde blanco
            ),
          ),
          child: Text(
            day,
            style: TextStyle(
                fontSize: 22,
                color: Color.fromARGB(255, 255, 255, 255)), // Texto blanco
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          fondoPantalla(), // Fondo de pantalla de rutinas
          appBarPersonalizada(), // Barra de aplicación personalizada
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child:
                    SizedBox(), // Espacio expandido para llenar el espacio restante
              ),
              // Botones para cada día de la semana
              _buildDayButton(context, 'Lunes'),
              _buildDayButton(context, 'Martes'),
              _buildDayButton(context, 'Miércoles'),
              _buildDayButton(context, 'Jueves'),
              _buildDayButton(context, 'Viernes'),
              _buildDayButton(context, 'Sábado'),
              _buildDayButton(context, 'Domingo'),
              SizedBox(
                  height: 20), // Espacio entre botones y botón de "Terminar"
              ElevatedButton(
                onPressed: () {
                  _showSaveRoutineDialog(
                      context); // Mostrar el diálogo para guardar la rutina
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  backgroundColor: Color.fromARGB(
                      255, 0, 85, 244), // Fondo azul del botón "Terminar"
                  foregroundColor:
                      Colors.white, // Texto blanco del botón "Terminar"
                  textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0), // Estilo del texto del botón
                ),
                child: Text('Terminar'), // Texto del botón "Terminar"
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Widget para el fondo de pantalla de rutinas
  Widget fondoPantalla() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/imagenes/fondos/fondo_rutina.png'), // Imagen de fondo
          fit: BoxFit.cover, // Ajuste de la imagen
        ),
      ),
    );
  }

  // Widget para la barra de aplicación personalizada
  Widget appBarPersonalizada() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        foregroundColor:
            Colors.white, // Color del texto de la barra de aplicación
        backgroundColor:
            Colors.transparent, // Fondo transparente de la barra de aplicación
        elevation: 0, // Sin sombra
        title: Text(
          'Menú de Rutinas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 26.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Centrar el título en la barra de aplicación
      ),
    );
  }

  // Función para mostrar el diálogo de guardar rutina
  void _showSaveRoutineDialog(BuildContext context) {
    TextEditingController nombreRutinaController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Guardar Rutina'), // Título del diálogo
          content: TextField(
            controller: nombreRutinaController,
            decoration: InputDecoration(
                labelText:
                    'Nombre de la rutina'), // Etiqueta del campo de texto
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('Cancelar'), // Botón de cancelar
            ),
            ElevatedButton(
              onPressed: () {
                // Crear la rutina con el nombre proporcionado
                Rutina rutina = Rutina(
                  nombre: nombreRutinaController.text,
                  rutinas: Map<String, List<String>>.from(rutinas),
                );

                // Guardar la rutina usando RutinaManager
                RutinaManager().addRutina(rutina);

                Navigator.of(context).pop(); // Cerrar el diálogo
                Navigator.of(context).pop(); // Cerrar la pantalla actual
              },
              child: Text('Guardar'), // Botón de guardar
            ),
          ],
        );
      },
    );
  }
}
