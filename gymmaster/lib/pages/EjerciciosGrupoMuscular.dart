import 'package:flutter/material.dart';
import 'package:gymmaster/pages/DetalleEjercicioEspecifico.dart';

class ListaEjerciciosGrupoMuscular extends StatelessWidget {
  final List<String> ejercicios;
  final List<String> videos;
  final List<String> descripciones;

  ListaEjerciciosGrupoMuscular({
    required this.ejercicios,
    required this.videos,
    required this.descripciones,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white, // Color del texto del app bar
        title: Text('Lista de Ejercicios'), // Título del app bar
        backgroundColor: Colors.black, // Color de fondo del app bar
      ),
      body: Container(
        padding: EdgeInsets.all(15), // Padding del contenedor principal
        color: Colors.black, // Color de fondo del contenedor principal
        child: ListView.builder(
          itemCount: ejercicios.length, // Cantidad de elementos en la lista
          itemBuilder: (context, index) {
            return Card(
              color:
                  Color.fromARGB(255, 255, 217, 0), // Color de fondo del card
              child: ListTile(
                title: Text(
                  ejercicios[index], // Título del ejercicio
                  style: TextStyle(
                    color: const Color.fromARGB(
                        255, 0, 0, 0), // Color del texto del ejercicio
                    fontWeight:
                        FontWeight.bold, // Negrita para el título del ejercicio
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetalleEjercicioDetalle(
                        titulo: ejercicios[
                            index], // Título del ejercicio para mostrar en el detalle
                        videoAssetPath: videos[
                            index], // Ruta del video del ejercicio para mostrar en el detalle
                        descripcion: descripciones[
                            index], // Descripción del ejercicio para mostrar en el detalle
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
