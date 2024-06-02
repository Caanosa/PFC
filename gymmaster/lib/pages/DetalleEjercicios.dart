// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:gymmaster/pages/EjerciciosGrupoMuscular.dart';

class DetalleEjercicios extends StatelessWidget {
  final int index; // Índice para seleccionar los datos correspondientes

  // Constructor que recibe el índice requerido
  DetalleEjercicios({required this.index});

  // Listas que contienen los nombres, imágenes de fondo, videos y descripciones
  List<List<String>> nombres = [
    ['Superior', 'Medio', 'Inferior'],
    ['Cuadriceps', 'Gluteos', 'Gemelos'],
    ['Espalda'],
    ['Triceps', 'Biceps', 'Antebrazo'],
    ['Abdominales'],
    ['Hombros']
  ];

  List<List<String>> imagenesFondo = [
    [
      'assets/imagenes/fondos/superior.png',
      'assets/imagenes/fondos/medio.png',
      'assets/imagenes/fondos/inferior.png',
    ],
    [
      'assets/imagenes/fondos/cuadricepsFondo.png',
      'assets/imagenes/fondos/gluteosFondo.png',
      'assets/imagenes/fondos/gemelosFondo.png'
    ],
    [
      'assets/imagenes/fondos/espaldaFondo.png',
    ],
    [
      'assets/imagenes/fondos/tricepsFondo.png',
      'assets/imagenes/fondos/bicepsFondo.png',
      'assets/imagenes/fondos/antebrazoFondo.png'
    ],
    [
      'assets/imagenes/fondos/abdominalesFondo.png',
    ],
    [
      'assets/imagenes/fondos/hombrosFondo.png',
    ]
  ];

  List<List<List<String>>> videos = [
    [
      ['assets/videos/pressInclinado.mp4'],
      ['assets/videos/pressPlano.mp4'],
      ['assets/videos/pectoralInferior.mp4'],
    ],
    [
      [
        'assets/videos/sentadillaBulgara.mp4',
      ],
      [
        'assets/videos/puenteGluteo.mp4',
      ],
      [
        'assets/videos/elevacionTalon.mp4',
      ],
    ],
    [
      ['assets/videos/remoBarra.mp4'],
    ],
    [
      ['assets/videos/pressFrances.mp4'],
      ['assets/videos/curlMartillo.mp4'],
      ['assets/videos/curlMuneca.mp4'],
    ],
    [
      ['assets/videos/crunchPolea.mp4'],
    ],
    [
      ['assets/videos/pressMilitar.mp4'],
    ],
  ];

  List<List<List<String>>> descripciones = [
    [
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición corporal: Acuéstate en un banco inclinado con la espalda apoyada y los pies firmemente plantados en el suelo.\n2. Agarre: Agarra la barra ligeramente más ancha que el ancho de los hombros, manteniendo los codos hacia afuera.\n3. Descenso controlado: Baja la barra hacia el pecho de manera controlada y uniforme, manteniendo los codos ligeramente flexionados.\n4. Impulso: Utiliza la fuerza de los músculos pectorales y tríceps para empujar la barra hacia arriba, evitando el impulso excesivo.\n5. Respiración: Exhala al empujar la barra hacia arriba y mantén una respiración constante durante todo el ejercicio.\n\nConsejos de seguridad:\n1. Calentamiento: Realiza un calentamiento adecuado antes de comenzar el ejercicio para preparar los músculos y reducir el riesgo de lesiones.\n2. Observador: Siempre entrena con un observador o compañero de entrenamiento que pueda ayudarte en caso de que necesites ayuda al levantar la barra.\n3. Control de peso: No intentes levantar más peso del que puedes manejar de manera segura y controlada. Utiliza un peso que te permita mantener una técnica adecuada en todo momento.\n4. Flexión de muñeca: Evita la flexión excesiva de las muñecas al sostener la barra. Mantén las muñecas rectas para evitar lesiones.\n5. Descanso entre series: Permite suficiente tiempo de descanso entre series para recuperarte adecuadamente y evitar el agotamiento muscular excesivo.'
      ],
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición corporal: Acuéstate sobre el banco con la espalda completamente apoyada. Los pies deben estar firmemente plantados en el suelo para proporcionar estabilidad.\n2. Agarre: Agarra la barra ligeramente más ancha que el ancho de los hombros. Asegúrate de que tus manos estén simétricas en la barra.\n3. Descenso controlado: Baja la barra hacia el centro del pecho de manera controlada y uniforme, manteniendo los codos ligeramente flexionados.\n4. Impulso: Evita impulsar la barra hacia arriba con un movimiento brusco. En su lugar, utiliza la fuerza de los músculos pectorales y tríceps para levantarla.\n5. Respiración: Exhala al empujar la barra hacia arriba y mantén una respiración constante durante todo el ejercicio.\n\nConsejos de seguridad:\n1. Calentamiento: Realiza un calentamiento adecuado antes de comenzar el ejercicio para preparar los músculos y reducir el riesgo de lesiones.\n2. Observador: Siempre entrena con un observador o compañero de entrenamiento que pueda ayudarte en caso de que necesites ayuda al levantar la barra.\n3. Control de peso: No intentes levantar más peso del que puedes manejar de manera segura y controlada. Utiliza un peso que te permita mantener una técnica adecuada en todo momento.\n4. Flexión de muñeca: Evita la flexión excesiva de las muñecas al sostener la barra. Mantén las muñecas rectas para evitar lesiones.\n5. Descanso entre series: Permite suficiente tiempo de descanso entre series para recuperarte adecuadamente y evitar el agotamiento muscular excesivo.'
      ],
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición inicial: Colócate frente a la polea con los pies separados al ancho de los hombros y las rodillas ligeramente flexionadas.\n2. Agarre: Toma el mango de la polea con ambas manos, con los brazos extendidos frente a ti y las palmas mirando hacia abajo.\n3. Movimiento: Mantén los brazos ligeramente flexionados y baja el mango hacia atrás y por encima de tu cabeza, manteniendo los codos ligeramente flexionados.\n4. Estiramiento: Siente el estiramiento en los músculos del pecho y la parte superior de la espalda mientras bajas el mango.\n5. Concentración muscular: Contrae los músculos del pecho y la espalda para llevar el mango de vuelta a la posición inicial, manteniendo el control del movimiento en todo momento.\n6. Respiración: Exhala al llevar el mango hacia atrás y hacia arriba, e inhala al regresar a la posición inicial.\n\nConsejos de seguridad:\n1. Selección de peso: Elige un peso que te permita realizar el ejercicio con buena forma y control. Evita levantar más peso del que puedes manejar de manera segura.\n2. Control del movimiento: Mantén el control del movimiento en todo momento para evitar lesiones. Evita balancear el cuerpo o hacer movimientos bruscos.\n3. Amplitud de movimiento: No fuerces la amplitud de movimiento más allá de tu rango natural. Detén el movimiento si sientes dolor o incomodidad.\n4. Estabilidad: Mantén una postura estable y controlada durante todo el ejercicio. Evita arquear la espalda o balancearte hacia adelante o hacia atrás.\n5. Consulta con un profesional: Si tienes lesiones previas en la espalda, hombros o pecho, consulta con un profesional de la salud antes de realizar este ejercicio para asegurarte de que sea seguro para ti.'
      ],
    ],
    [
      [
        'Dificultad: Avanzada\n\nConsejos de técnica:\n1. Posición inicial: Colócate de pie frente a un banco o step con una pierna extendida hacia atrás y el otro pie firmemente plantado en el suelo.\n2. Postura: Mantén la espalda recta y el pecho erguido durante todo el movimiento.\n3. Descenso: Flexiona la rodilla de la pierna delantera mientras bajas el cuerpo hacia el suelo, manteniendo la rodilla trasera ligeramente por encima del suelo.\n4. Profundidad: Baja hasta que la rodilla delantera forme un ángulo de 90 grados, asegurándote de que la rodilla no se extienda más allá de los dedos del pie.\n5. Impulso: Empuja hacia arriba desde el talón de la pierna delantera para volver a la posición inicial.\n6. Equilibrio: Mantén el equilibrio y la estabilidad durante todo el movimiento, utilizando los músculos del core para mantener el cuerpo en posición.\n\nConsejos de seguridad:\n1. Estabilidad: Asegúrate de que el banco o step esté colocado de manera estable antes de comenzar el ejercicio para evitar caídas o lesiones.\n2. Control de peso: Comienza con poco peso o incluso sin peso adicional hasta que domines la técnica del ejercicio. Luego, aumenta progresivamente la resistencia.\n3. Observación del movimiento: Realiza el ejercicio frente a un espejo o con la supervisión de un entrenador para corregir cualquier desviación de la forma correcta.\n4. Alcance de movimiento: No fuerces el rango de movimiento más allá de tu capacidad. Detente si sientes algún tipo de dolor o incomodidad.\n5. Alternativas: Si tienes problemas de equilibrio o fuerza, puedes realizar el ejercicio utilizando solamente el peso corporal o con el apoyo de un objeto cercano para mayor estabilidad.',
      ],
      [
        'Dificultad: Fácil\n\nConsejos de técnica:\n1. Posición inicial: Acuéstate boca arriba con las rodillas dobladas y los pies apoyados en el suelo, separados a la altura de las caderas.\n2. Activación de los glúteos: Contrae los músculos de los glúteos y levanta las caderas hacia arriba, formando una línea recta desde las rodillas hasta los hombros.\n3. Mantén la posición: Mantén la posición durante unos segundos, asegurándote de mantener los glúteos activados.\n4. Descenso controlado: Baja las caderas lentamente hacia el suelo, manteniendo el control del movimiento.\n5. Repeticiones: Realiza el número deseado de repeticiones.\n\nConsejos de seguridad:\n1. Control de la respiración: Exhala al levantar las caderas y mantén una respiración constante durante todo el ejercicio.\n2. Evita arquear la espalda: Mantén la espalda en una posición neutra para evitar lesiones en la parte baja de la espalda.\n3. No levantes demasiado alto: Evita levantar las caderas más alto de lo necesario para evitar tensión excesiva en la espalda.\n4. No bloquee las rodillas: Mantén las rodillas ligeramente flexionadas en todo momento para evitar la hiperextensión de las articulaciones.\n5. Escucha a tu cuerpo: Si sientes dolor o incomodidad, detén el ejercicio y consulta a un profesional de la salud.',
      ],
      [
        'Dificultad: Moderada\n\nConsejos de técnica:\n1. Posición inicial: Colócate de pie con los pies separados a la anchura de los hombros y los brazos a los lados del cuerpo.\n2. Elevación de talones: Levanta lentamente los talones lo más alto posible mientras mantienes el resto del cuerpo inmóvil.\n3. Contracción muscular: Mantén la posición elevada durante un segundo para maximizar la contracción de los músculos de la pantorrilla.\n4. Descenso controlado: Baja lentamente los talones de regreso al suelo, evitando golpearlos bruscamente.\n5. Repeticiones y series: Realiza el número recomendado de repeticiones y series para completar el ejercicio de manera efectiva.\n\nConsejos de seguridad:\n1. Calentamiento: Realiza un calentamiento adecuado antes de realizar la elevación de talones para preparar los músculos de la pantorrilla.\n2. Postura correcta: Mantén una postura erguida y evita el balanceo del cuerpo durante el ejercicio para reducir el riesgo de lesiones.\n3. Amplitud de movimiento: Evita la hiperextensión de los tobillos al levantar los talones para prevenir lesiones.\n4. Peso adecuado: Selecciona un peso que te desafíe pero que te permita realizar el ejercicio con buena forma y control.\n5. Consulta médica: Si tienes lesiones previas en los tobillos o las pantorrillas, consulta a un profesional de la salud antes de realizar este ejercicio.',
      ],
    ],
    [
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición inicial: Párate con los pies separados al ancho de los hombros, con las rodillas ligeramente flexionadas. Inclínate hacia adelante desde las caderas manteniendo la espalda recta.\n2. Agarre: Sujeta la barra con un agarre amplio, con las palmas mirando hacia abajo. Mantén los brazos completamente extendidos.\n3. Elevación de la barra: Tira de la barra hacia arriba hacia la parte inferior del pecho, manteniendo los codos cerca del cuerpo y los omóplatos juntos.\n4. Concentración en la espalda: Concéntrese en contraer los músculos de la espalda mientras levanta la barra. Evita el impulso excesivo de otros grupos musculares.\n5. Descenso controlado: Baja la barra de manera controlada hasta que los brazos estén completamente extendidos, manteniendo la espalda recta en todo momento.\n\nConsejos de seguridad:\n1. Calentamiento: Realiza un calentamiento adecuado antes de comenzar el ejercicio para preparar los músculos y reducir el riesgo de lesiones.\n2. Postura correcta: Mantén una postura adecuada durante todo el ejercicio para evitar lesiones en la espalda. No arquees la espalda ni encorves los hombros.\n3. Control de peso: Utiliza un peso que te permita mantener una técnica adecuada en todo momento. Evita levantar más peso del que puedas manejar con seguridad.\n4. Observador: Siempre entrena con un observador o compañero de entrenamiento que pueda ayudarte a mantener la forma adecuada y proporcionarte asistencia si es necesario.\n5. Variaciones de agarre: Experimenta con diferentes anchos de agarre para dirigir el enfoque del ejercicio a diferentes áreas de la espalda y los músculos circundantes.'
      ],
    ],
    [
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición inicial: Acuéstate sobre un banco plano con una barra sostenida con las manos separadas a una distancia ligeramente menor que el ancho de los hombros.\n2. Movimiento descendente: Flexiona los codos para bajar lentamente la barra hacia la frente, manteniendo los codos apuntando hacia adelante y los brazos perpendiculares al suelo.\n3. Control del movimiento: Mantén los codos cerca de la cabeza y evita mover los hombros o la espalda durante el ejercicio.\n4. Extensión: Extiende los codos para levantar la barra de nuevo a la posición inicial, manteniendo el control del movimiento en todo momento.\n5. Respiración: Exhala al levantar la barra y inhala al bajarla hacia la frente.',
        'Consejos de seguridad:\n1. Calentamiento: Realiza un calentamiento adecuado antes de realizar el ejercicio para preparar los músculos y reducir el riesgo de lesiones.\n2. Utiliza un peso adecuado: Selecciona un peso que te permita mantener una forma adecuada durante todo el ejercicio y evita cargar demasiado peso que pueda causar lesiones.\n3. Mantén la estabilidad: Mantén los pies firmemente plantados en el suelo y la espalda apoyada en el banco para evitar lesiones en la columna vertebral.\n4. Evita el rebote: Evita rebotar la barra en el pecho al levantarla, ya que esto puede aumentar el riesgo de lesiones en los hombros y los codos.\n5. Controla el ritmo: Realiza el ejercicio de forma controlada y evita movimientos bruscos para minimizar el riesgo de lesiones musculares.'
      ],
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición corporal: Mantén una postura erguida con los pies separados al ancho de los hombros y las rodillas ligeramente flexionadas.\n2. Agarre: Sujeta las pesas con un agarre neutro (palmas mirándose) a los lados del cuerpo, con los brazos extendidos completamente hacia abajo.\n3. Movimiento: Eleva las pesas hacia los hombros mientras mantienes los codos pegados al cuerpo y las muñecas rectas. Evita balancear los brazos para obtener impulso.\n4. Contracción muscular: Haz una breve pausa en la parte superior del movimiento, sintiendo la contracción en los músculos del brazo.\n5. Descenso controlado: Baja las pesas de manera controlada a la posición inicial, evitando dejar caer los brazos bruscamente.\n\nConsejos de seguridad:\n1. Control de peso: Utiliza un peso adecuado que te permita mantener una buena técnica durante todo el ejercicio. Evita cargar demasiado peso, lo que podría aumentar el riesgo de lesiones.\n2. Postura adecuada: Mantén una postura estable y evita balancear el cuerpo mientras realizas el ejercicio para minimizar el riesgo de lesiones en la espalda.\n3. Respiración: Exhala al levantar las pesas y mantén una respiración constante durante todo el movimiento. No contengas la respiración, ya que esto puede aumentar la presión arterial y la tensión muscular.\n4. Control del codo: Evita mover los codos hacia adelante o hacia atrás durante el movimiento. Manténlos en una posición fija junto al cuerpo para maximizar la activación muscular en los músculos del brazo.\n5. Descanso entre series: Permite suficiente tiempo de descanso entre series para recuperarte adecuadamente y evitar el agotamiento muscular excesivo.'
      ],
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición inicial: Siéntate en un banco con los pies planos en el suelo, manteniendo la espalda recta y los hombros hacia atrás.\n2. Agarre: Sujeta la barra con un agarre supino (palmas hacia arriba) y las manos separadas al ancho de los hombros.\n3. Movimiento: Flexiona las muñecas hacia arriba, manteniendo los antebrazos apoyados en los muslos y los codos estables.\n4. Control: Realiza el movimiento de forma lenta y controlada, evitando movimientos bruscos o balanceos.\n5. Rango de movimiento: Levanta la barra lo más alto posible sin mover los antebrazos, y luego baja lentamente hasta la posición inicial.\n\nConsejos de seguridad:\n1. Peso adecuado: Comienza con un peso ligero para familiarizarte con el movimiento y evitar lesiones.\n2. Mantén la muñeca recta: Evita doblar la muñeca hacia atrás mientras levantas la barra para prevenir lesiones en la muñeca.\n3. Respiración: Mantén una respiración controlada y regular durante todo el ejercicio para evitar la hipertensión.\n4. Control muscular: Concéntrate en contraer los músculos de la muñeca mientras levantas la barra, y mantén el control en todo momento.\n5. Calentamiento: Realiza un calentamiento adecuado antes de comenzar el ejercicio para preparar los músculos y reducir el riesgo de lesiones.'
      ],
    ],
    [
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición inicial: Colócate de pie frente a la máquina de polea con la barra alta ajustada. Agarra la cuerda o la barra con ambas manos por encima de los hombros.\n2. Posición corporal: Mantén una postura erguida con los pies separados a la anchura de los hombros y las rodillas ligeramente flexionadas para mayor estabilidad.\n3. Movimiento: Flexiona el torso hacia adelante y hacia abajo, contrayendo los músculos abdominales mientras llevas los codos hacia las rodillas.\n4. Concentración: Asegúrate de concentrarte en contraer los abdominales en cada repetición, evitando usar impulso para realizar el movimiento.\n5. Amplitud de movimiento: Evita la hiperextensión de la columna vertebral en la posición superior del movimiento. Mantén un rango de movimiento controlado y cómodo para tus abdominales.\n\nConsejos de seguridad:\n1. Selección de peso: Comienza con un peso ligero y aumenta gradualmente según tu nivel de fuerza y comodidad con el ejercicio.\n2. Control de la respiración: Exhala mientras contraes los abdominales durante el movimiento y exhala mientras regresas a la posición inicial.\n3. Evita el balanceo: Mantén el cuerpo estable y evita balancearte hacia adelante y hacia atrás mientras realizas el ejercicio para minimizar el riesgo de lesiones.\n4. Consulta con un profesional: Si tienes lesiones previas en la espalda o el cuello, o si experimentas algún tipo de molestia durante el ejercicio, consulta a un profesional de la salud antes de continuar.\n5. Escucha a tu cuerpo: Si sientes dolor o molestias inusuales durante el ejercicio, detente de inmediato y revisa tu técnica o reduce la cantidad de peso utilizado. Tu seguridad es lo más importante.'
      ],
    ],
    [
      [
        'Dificultad: Intermedia\n\nConsejos de técnica:\n1. Posición inicial: Colócate de pie con los pies a la altura de los hombros y la barra apoyada en la parte delantera de los hombros, con las palmas de las manos mirando hacia adelante y los codos apuntando hacia abajo.\n2. Levantamiento: Levanta la barra sobre la cabeza extendiendo los brazos completamente, manteniendo los codos ligeramente flexionados al final del movimiento.\n3. Control del movimiento: Evita arquear la espalda excesivamente durante el levantamiento. Mantén los abdominales contraídos y la espalda recta para evitar lesiones.\n4. Descenso: Baja la barra de manera controlada hasta que los codos estén ligeramente por debajo de los hombros, manteniendo el control en todo momento.\n5. Respiración: Exhala al levantar la barra sobre la cabeza y inhala al bajarla.\n\nConsejos de seguridad:\n1. Calentamiento: Realiza un calentamiento adecuado para preparar los músculos y articulaciones antes de comenzar el ejercicio.\n2. Observador: Siempre entrena con un observador o compañero de entrenamiento que pueda ayudarte en caso de que necesites asistencia al levantar la barra.\n3. Control del peso: Utiliza un peso que puedas manejar de manera segura y controlada. No te excedas levantando más peso del que puedas manejar adecuadamente.\n4. Posición de las muñecas: Mantén las muñecas en una posición neutra para evitar lesiones en las articulaciones.\n5. Rango de movimiento: Realiza el ejercicio dentro de un rango de movimiento que te resulte cómodo y seguro. No fuerces el movimiento más allá de tus límites.'
      ],
    ],
  ];

  List<List<List<String>>> nombresVideos = [
    [
      ['Press Inclinado'],
      ['Press Plano'],
      ['Pectoral Inferior'],
    ],
    [
      [
        'Sentadilla Búlgara',
      ],
      [
        'Puente de Glúteo',
      ],
      [
        'Elevación de Talones',
      ],
    ],
    [
      ['Remo con Barra'],
    ],
    [
      ['Press Francés'],
      ['Curl Martillo'],
      ['Curl de Muñeca con Barra'],
    ],
    [
      ['Crunch de Polea'],
    ],
    [
      ['Press Militar'],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo de pantalla para la pantalla
          fondoPantalla(),

          // AppBar personalizada posicionada en la parte superior de la pantalla
          appBarPersonalizada(),

          // Padding y ListView que contiene widgets de ejercicios
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Generar widgets de ejercicios basados en listas de datos
                      for (int i = 0; i < nombres[index].length; i++)
                        ejercicioWidget(
                          context,
                          nombres[index][i],
                          imagenesFondo[index][i],
                          nombresVideos[index][i],
                          videos[index][i],
                          descripciones[index][i],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

// Widget para el fondo de pantalla
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

// Widget para la AppBar personalizada
  Widget appBarPersonalizada() {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: AppBar(
        foregroundColor: Colors.white,
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

// Widget para cada elemento de ejercicio
  Widget ejercicioWidget(
    BuildContext context,
    String titulo,
    String imagePath,
    List<String> nombresVideos,
    List<String> videos,
    List<String> descripciones,
  ) {
    return InkWell(
      onTap: () {
        // Navegar a una nueva pantalla que muestra los detalles del ejercicio
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ListaEjerciciosGrupoMuscular(
              videos: videos,
              descripciones: descripciones,
              ejercicios: nombresVideos,
            ),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        height: 150,
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 210,
              top: 0,
              bottom: 0,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: EdgeInsets.all(8),
                  color: Color.fromARGB(100, 0, 0, 0),
                  child: Text(
                    titulo,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
