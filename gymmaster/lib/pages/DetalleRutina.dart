import 'package:flutter/material.dart';

class DetalleRutinaScreen extends StatefulWidget {
  final String day; // Día de la rutina
  final Map<String, List<String>>
      rutinas; // Mapa que contiene las rutinas por día

  DetalleRutinaScreen({required this.day, required this.rutinas});

  @override
  _DetalleRutinaScreenState createState() => _DetalleRutinaScreenState();
}

class _DetalleRutinaScreenState extends State<DetalleRutinaScreen> {
  TextEditingController ejercicioController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  TextEditingController seriesController = TextEditingController();
  TextEditingController repeticionesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> ejercicios = widget.rutinas[widget.day] ??
        []; // Lista de ejercicios para el día seleccionado

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: Text(
            'Rutina del ${widget.day}'), // Título de la AppBar con el día de la rutina
      ),
      backgroundColor:
          Colors.black, // Fondo negro para el cuerpo de la pantalla
      body: ListView.builder(
        itemCount: ejercicios.length,
        itemBuilder: (context, index) {
          List<String> ejercicioDetails = ejercicios[index].split(' - ');

          String nombreEjercicio = ejercicioDetails[0];
          String peso = ejercicioDetails[1].split(': ')[1];
          String series = ejercicioDetails[2].split(': ')[1];
          String repeticiones = ejercicioDetails[3].split(': ')[1];

          String ejercicioFormateado =
              '$nombreEjercicio\nPeso: $peso     $series x $repeticiones '; // Formato del texto del ejercicio

          return Card(
            // Utilizamos un Card para mostrar los detalles de cada ejercicio
            color: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              title: Text(
                ejercicioFormateado,
                style: TextStyle(color: Colors.black),
              ),
              onTap:
                  () {}, // Acción al tocar un ejercicio (en este caso no tiene acción)
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddExerciseDialog(context);
        },
        child:
            Icon(Icons.add), // Icono de añadir ejercicio en el botón flotante
      ),
    );
  }

  // Función para mostrar el diálogo de añadir ejercicio
  void _showAddExerciseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Añadir Ejercicio'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: ejercicioController,
                  decoration:
                      InputDecoration(labelText: 'Nombre del ejercicio'),
                ),
                TextField(
                  controller: pesoController,
                  decoration: InputDecoration(labelText: 'Peso (kg)'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: seriesController,
                  decoration: InputDecoration(labelText: 'Series'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: repeticionesController,
                  decoration: InputDecoration(labelText: 'Repeticiones'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cierra el diálogo al presionar 'Cancelar'
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Guardar el ejercicio con los datos ingresados
                String ejercicio =
                    '${ejercicioController.text} - Peso: ${pesoController.text} kg - Series: ${seriesController.text} - Repeticiones: ${repeticionesController.text}';
                widget.rutinas[widget.day]!.add(
                    ejercicio); // Agrega el ejercicio a la lista de ejercicios del día
                setState(
                    () {}); // Actualiza la interfaz de usuario para reflejar el cambio
                Navigator.of(context)
                    .pop(); // Cierra el diálogo de añadir ejercicio
              },
              child: Text('Guardar'),
            ),
          ],
        );
      },
    );
  }
}
