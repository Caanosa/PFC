// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gymmaster/objects/Variable.dart';
import 'package:gymmaster/pages/ContenedorPerfil.dart';
import 'package:table_calendar/table_calendar.dart';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<bool> _isChecked = [false, false, false];
  final List<String> _allMissions = [
    'Hacer 10 flexiones (200xp)',
    'Correr 5 kilómetros (200xp)',
    'Hacer 20 abdominales (200xp)',
    'Saltar la cuerda durante 10 minutos (200xp)',
    'Realizar 15 sentadillas (200xp)',
    'Hacer 20 zancadas (200xp)',
    'Mantener la plancha durante 2 minutos (200xp)',
    'Subir y bajar escaleras durante 15 minutos (200xp)',
    'Hacer una caminata de 30 minutos (200xp)'
  ];
  final List<String> _gymTips = [
    'Mantén una buena postura',
    'Hidrátate adecuadamente',
    'Calienta antes de entrenar',
    'Enfría después del entrenamiento',
    'Usa el equipo correctamente',
    'Escucha a tu cuerpo',
    'Varía tu rutina de ejercicios',
    'Descansa lo suficiente',
    'Mantén una dieta balanceada',
  ];
  List<String> _selectedMissions = [];
  late PageController _pageController;
  int _currentPage = 0;
  final int _maxXP = 3000;

  // Variables para el calendario
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    _selectRandomMissions();
    _pageController = PageController(initialPage: 0);
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < _gymTips.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      }
    });
  }

  void _selectRandomMissions() {
    final random = Random();
    Set<int> selectedIndices = {};
    while (selectedIndices.length < 3) {
      selectedIndices.add(random.nextInt(_allMissions.length));
    }
    _selectedMissions =
        selectedIndices.map((index) => _allMissions[index]).toList();
  }

  void _completeMission(int index) {
    setState(() {
      _isChecked[index] = true;
      Variable.usuario.xp += 200;
      if (Variable.usuario.xp > _maxXP) {
        Variable.usuario.xp = _maxXP;
      }
    });
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _addEvent(String event) {
    if (_selectedDay != null) {
      setState(() {
        if (_events[_selectedDay] == null) {
          _events[_selectedDay!] = [];
        }
        _events[_selectedDay]!.add(event);
      });
    }
  }

  void _showAddEventDialog() {
    TextEditingController eventController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Añadir Evento'),
          content: TextField(
            controller: eventController,
            decoration: InputDecoration(hintText: 'Escribe tu evento aquí'),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Añadir'),
              onPressed: () {
                _addEvent(eventController.text);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double progress = (Variable.usuario.xp / _maxXP) * 100;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image:
                    AssetImage('assets/imagenes/fondos/fondo_provisional2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: TrapezoidContainer(
              width: 320.0,
              height: 65.0,
              backgroundColor: const Color.fromARGB(255, 0, 0, 0),
              borderColor: Color.fromARGB(142, 255, 255, 255),
              borderWidth: 2.0,
              currentXP: Variable.usuario.xp,
              maxXP: _maxXP,
              progress: progress,
            ),
          ),
          Positioned(
            top: 120.0,
            left: 16.0,
            right: 16.0,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color.fromARGB(220, 156, 144, 36),
                      width: 2.0,
                    ),
                  ),
                  child: Column(
                    children: List.generate(3, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              _selectedMissions[index],
                              style: TextStyle(
                                color: Colors.white,
                                decoration: _isChecked[index]
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                              ),
                            ),
                          ),
                          Checkbox(
                            value: _isChecked[index],
                            onChanged: (bool? value) {
                              if (value != null &&
                                  value &&
                                  !_isChecked[index]) {
                                _completeMission(index);
                              }
                            },
                            activeColor: Color.fromARGB(255, 255, 236, 64),
                            checkColor: Colors.black,
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20.0), // Espacio entre los contenedores
                Container(
                  width: 295,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color.fromARGB(220, 156, 144, 36),
                      width: 2.0,
                    ),
                  ),
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _gymTips.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Text(
                          _gymTips[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                    height: 20.0), // Espacio entre los consejos y el calendario
                Container(
                  width: 295,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Color.fromARGB(220, 156, 144, 36),
                      width: 2.0,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (_selectedDay == selectedDay) {
                              _showAddEventDialog();
                            } else {
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          onFormatChanged: (format) {
                            setState(() {
                              _calendarFormat = format;
                            });
                          },
                          eventLoader: _getEventsForDay,
                          calendarStyle: CalendarStyle(
                            outsideDaysVisible: false,
                            weekendTextStyle:
                                TextStyle().copyWith(color: Colors.white),
                            defaultTextStyle:
                                TextStyle().copyWith(color: Colors.white),
                            selectedTextStyle:
                                TextStyle().copyWith(color: Colors.black),
                            todayTextStyle:
                                TextStyle().copyWith(color: Colors.white),
                            selectedDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 236, 64),
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 200, 200, 200),
                              shape: BoxShape.circle,
                            ),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonVisible: true,
                            titleTextStyle: TextStyle(color: Colors.white),
                            formatButtonTextStyle:
                                TextStyle(color: Colors.black),
                            formatButtonDecoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 236, 64),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            leftChevronIcon:
                                Icon(Icons.chevron_left, color: Colors.white),
                            rightChevronIcon:
                                Icon(Icons.chevron_right, color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 10.0), // Espacio entre el calendario y los eventos
                        if (_selectedDay != null &&
                            _events[_selectedDay] != null)
                          Column(
                            children: _events[_selectedDay]!.map((event) {
                              return ListTile(
                                title: Text(
                                  event,
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            }).toList(),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor: const Color.fromARGB(0, 222, 1, 1),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }
}