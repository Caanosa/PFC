import 'package:flutter/material.dart';
import 'package:gymmaster/objects/RutinaManager.dart';
import 'package:gymmaster/pages/DetalleRutinaCompleta.dart';

class ContainerSwitcher extends StatefulWidget {
  @override
  _ContainerSwitcherState createState() => _ContainerSwitcherState();
}

class _ContainerSwitcherState extends State<ContainerSwitcher> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<Rutina> rutinasGuardadas = [];

  @override
  void initState() {
    super.initState();
    // Obtener las rutinas guardadas al inicializar el estado
    rutinasGuardadas = RutinaManager().getRutinas();
  }

  // Función para avanzar a la siguiente página
  void _nextPage() {
    if (_currentIndex < rutinasGuardadas.length - 1) {
      _currentIndex++;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Función para retroceder a la página anterior
  void _previousPage() {
    if (_currentIndex > 0) {
      _currentIndex--;
      _pageController.animateToPage(
        _currentIndex,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Función para navegar a la pantalla de detalle de rutina completa
  void _navigateToDetalleRutina(Rutina rutina) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetalleRutinaCompletaScreen(rutina: rutina),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Elige tu Rutina',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_left,
                color: Colors.white,
                size: 50,
              ),
              onPressed: _previousPage,
            ),
            Container(
              width: 250,
              height: 500,
              child: PageView.builder(
                controller: _pageController,
                itemCount: rutinasGuardadas.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  Rutina rutina = rutinasGuardadas[index];
                  return GestureDetector(
                    onTap: () => _navigateToDetalleRutina(rutina),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: Center(
                          child: Text(
                            rutina.nombre,
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 50,
              ),
              onPressed: _nextPage,
            ),
          ],
        ),
      ],
    );
  }
}
