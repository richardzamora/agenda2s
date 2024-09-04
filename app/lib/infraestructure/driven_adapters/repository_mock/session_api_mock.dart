import 'package:agenda2/agenda2.dart';

class SessionApiMock {
  static final List<Session> sessionsListMock = [
    Session(
        description: 'Introducción a Java. Clases, métodos y variables',
        date: DateTime(2024, 09, 16, 18),
        place: 'Virtual'),
    Session(
        description:
            'Introducción a Java. Tipos de dato, condicionales y bucles',
        date: DateTime(2024, 09, 23, 18),
        place: 'Virtual'),
    Session(
        description: 'Introducción a Java, Estructuras de datos más comunes',
        date: DateTime(2024, 09, 30, 18),
        place: 'Virtual'),
  ];
}
