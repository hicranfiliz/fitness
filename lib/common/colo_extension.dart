import 'package:flutter/material.dart';

class TColor {
  static Color get primaryColor1 => const Color(0xffE56B6F);
  static Color get primaryColor2 => const Color(0xffE88C7D);

  static Color get secondaryColor1 => const Color(0xff6D597A);
  static Color get secondaryColor2 => const Color(0xffB56576);

  static List<Color> get primaryG => [primaryColor1, primaryColor2];
  static List<Color> get secondaryG => [secondaryColor1, secondaryColor2];

  static Color get black => const Color(0xff355070);
  static Color get light => const Color(0xffeaac8b);
  static Color get white => Colors.white;
}
