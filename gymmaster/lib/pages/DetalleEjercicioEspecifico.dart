// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class DetalleEjercicioDetalle extends StatefulWidget {
  final String titulo;
  final String videoAssetPath;
  final String descripcion;

  DetalleEjercicioDetalle({
    required this.titulo,
    required this.videoAssetPath,
    required this.descripcion,
  });

  @override
  _DetalleEjercicioDetalleState createState() =>
      _DetalleEjercicioDetalleState();
}

class _DetalleEjercicioDetalleState extends State<DetalleEjercicioDetalle> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  Future<void> _initializeVideoPlayer() async {
    // Inicialización del controlador de video desde un asset
    _videoPlayerController =
        VideoPlayerController.asset(widget.videoAssetPath);
    
    // Esperar a que el controlador de video esté inicializado
    await _videoPlayerController.initialize();
    
    // Establecer el volumen en 0 para silenciar el video
    _videoPlayerController.setVolume(0.0);
    
    // Crear el controlador Chewie con opciones personalizadas
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 5 / 7,
      autoInitialize: false, // Deshabilitar la inicialización automática del video
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          ),
        );
      },
    );
    
    // Actualizar la interfaz de usuario después de la inicialización
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro para la pantalla
      appBar: AppBar(
        backgroundColor: Colors.black, // Fondo negro para la AppBar
        foregroundColor: Colors.white, // Texto blanco para la AppBar
        title: Text(widget.titulo), // Título de la AppBar obtenido de los parámetros
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 5 / 5,
              child: _chewieController != null &&
                      _chewieController!.videoPlayerController.value.isInitialized
                  ? Chewie(
                      controller: _chewieController!, // Mostrar el video Chewie si está inicializado
                    )
                  : Center(
                      child: CircularProgressIndicator(), // Mostrar indicador de carga mientras se inicializa el video
                    ),
            ),
            SizedBox(height: 30), // Espacio adicional entre elementos
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.descripcion, // Mostrar la descripción del ejercicio
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}