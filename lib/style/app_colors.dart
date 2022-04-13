import 'package:flutter/material.dart';

abstract class AppColors {
  static const yellowColor = Color.fromRGBO(231, 185, 68, 1);
  static const purpleGradient = LinearGradient(
    colors: [
      Color.fromRGBO(52, 40, 60, 1),
      Color.fromRGBO(132, 95, 161, 1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const greyTextColor = Color.fromRGBO(155, 155, 155, 1);
  static const orangeGradient = LinearGradient(
    colors: [
      Color.fromRGBO(210, 58, 58, 1),
      Color.fromRGBO(244, 151, 99, 1),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const starIconColor = Color.fromRGBO(242, 153, 74, 1);
  static const backGroundColor = Color.fromRGBO(244, 243, 244, 1);
  static const darkGreyTextColor = Color.fromRGBO(96, 90, 101, 1);
  static const darkTextColor = Color.fromRGBO(52, 40, 62, 1);
  static const bottomBarTextColor = Color.fromRGBO(64, 48, 77, 1);
  static const grayLightColor =Color.fromRGBO(225, 225, 225, 1);
}
