import 'package:flutter/material.dart';

abstract class AppGradient {
  static const purpleGradient = LinearGradient(
    colors: [
      Color.fromRGBO(52, 40, 60, 1),
      Color.fromRGBO(132, 95, 161, 1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const orangeGradient = LinearGradient(
    colors: [
      Color.fromRGBO(210, 58, 58, 1),
      Color.fromRGBO(244, 151, 99, 1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
