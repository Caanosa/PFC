import 'package:flutter/material.dart';
import 'package:gymmaster/objects/RutinaManager.dart';

class DetalleRutinaCompletaScreen extends StatelessWidget {
  final Rutina rutina;

  DetalleRutinaCompletaScreen({required this.rutina});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar con el nombre de la rutina como título
      appBar: AppBar(
        title: Text('Detalle de ${rutina.nombre}'),
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      // Fondo negro para el cuerpo de la pantalla
      backgroundColor: Colors.black,
      body: ListView(
        // Lista de ExpansionTiles, cada uno representa una categoría de ejercicios
        children: rutina.rutinas.entries.map((entry) {
          return ExpansionTile(
            // Título de cada ExpansionTile con el nombre de la categoría
            title: Text(entry.key, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
            children: entry.value.map((ejercicio) {
              return ListTile(
                // Lista de ListTile con los nombres de los ejercicios
                title: Text(ejercicio, style: TextStyle(fontSize: 18, color: Colors.white)),
                tileColor: Colors.black54,
              );
            }).toList(),
          );
        }).toList(),
      ),
      // Botón flotante para mostrar un diálogo al completar la rutina
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCompletionDialog(context);
        },
        child: Icon(Icons.check),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Método para mostrar el diálogo de finalización de rutina
  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: _buildCompletionDialogContent(context),
        );
      },
    );
  }

  // Contenido del diálogo de finalización de rutina
  Widget _buildCompletionDialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Título del diálogo
              Text(
                '¡Felicidades!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              // Mensaje de rutina completada
              Text(
                'Rutina completada',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              // Icono y texto de recompensa
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star, color: Colors.amber),
                  SizedBox(width: 5),
                  Text(
                    '+400 XP',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 15),
              // Botón OK para cerrar el diálogo
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}