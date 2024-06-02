// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:gymmaster/pages/DetalleEjercicios.dart';

class Ejercicios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          fondoPantalla(), // Fondo de pantalla con imagen
          appBarPersonalizada(), // AppBar personalizada
          listaEjercicios(context), // Lista de ejercicios
        ],
      ),
    );
  }

  Widget fondoPantalla() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/imagenes/fondos/fondo_ejercicios.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget appBarPersonalizada() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Ejercicios',
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

  Widget listaEjercicios(BuildContext context) {
    return Positioned(
      top: kToolbarHeight + 10.0,
      left: 15.0,
      right: 15.0,
      child: Container(
        height: 640.0,
        child: ListView.builder(
          itemCount: 3, // Número de filas de ejercicios
          itemBuilder: (context, index) {
            List<String> imagenes = [
              'assets/imagenes/fondos/pecho.png',
              'assets/imagenes/fondos/pierna.png',
              'assets/imagenes/fondos/espalda.png',
              'assets/imagenes/fondos/brazo.png',
              'assets/imagenes/fondos/abs.png',
              'assets/imagenes/fondos/hombros.png'
            ];

            List<String> titulos = [
              'PECHO',
              'PIERNA',
              'ESPALDA',
              'BRAZO',
              'ABDOMINALES',
              'HOMBRO'
            ];

            return filaEjercicio(context, index, imagenes, titulos);
          },
        ),
      ),
    );
  }

  Widget filaEjercicio(BuildContext context, int index, List<String> imagenes,
      List<String> titulos) {
    int primerIndice = index * 2;
    int segundoIndice = index * 2 + 1;

    String primeraImagen = imagenes[primerIndice % imagenes.length];
    String primerTitulo = titulos[primerIndice % titulos.length];

    String segundaImagen = imagenes[segundoIndice % imagenes.length];
    String segundoTitulo = titulos[segundoIndice % titulos.length];

    return Column(
      children: [
        SizedBox(height: 20), // Espacio entre filas
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Primera columna
            ejercicioWidget(context, primerTitulo, primeraImagen, primerIndice),
            SizedBox(width: 20), // Espacio entre contenedores
            // Segunda columna
            ejercicioWidget(
                context, segundoTitulo, segundaImagen, segundoIndice),
          ],
        ),
      ],
    );
  }

  Widget ejercicioWidget(
      BuildContext context, String titulo, String imagePath, int index) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetalleEjercicios(index: index),
        ),
      ),
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.only(bottom: 15),
        alignment: Alignment.bottomCenter,
        child: Text(
          titulo,
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
