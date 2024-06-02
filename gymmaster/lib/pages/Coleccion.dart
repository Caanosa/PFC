import 'package:flutter/material.dart';
import 'package:gymmaster/objects/Coleccion.dart';

class ColeccionScreen extends StatefulWidget {
  @override
  _ColeccionScreenState createState() => _ColeccionScreenState();
}

class _ColeccionScreenState extends State<ColeccionScreen> {
  late List<String> _imagePaths;
  late List<Coleccion> _coleccion;

  @override
  void initState() {
    super.initState();
    _imagePaths = List.generate(
        40, (index) => 'assets/imagenes/fondos/pegatinas/interrogation.png');
    _coleccion = List.generate(
      40,
      (index) => Coleccion(pegatina_id: index + 1),
    );
  }

  void _unlockImage(int index) {
    setState(() {
      _coleccion[index].desbloqueado = true;
      _imagePaths[index] = 'assets/imagenes/fondos/pegatinas/unlocked_${index + 1}.png';
    });
  }

  int _countUnlockedImages() {
    return _coleccion.where((pegatina) => pegatina.desbloqueado).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Colección',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 214, 191, 12),
                  Color.fromARGB(255, 255, 231, 110),
                ],
              ),
            ),
            child: GridView.count(
              crossAxisCount: 5,
              children: List.generate(40, (index) {
                return GestureDetector(
                  onTap: () {
                    if (!_coleccion[index].desbloqueado) {
                      _unlockImage(index);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: _coleccion[index].desbloqueado
                          ? Image.asset(
                              _imagePaths[index],
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/imagenes/fondos/pegatinas/interrogation.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${_countUnlockedImages()}/${_coleccion.length}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}