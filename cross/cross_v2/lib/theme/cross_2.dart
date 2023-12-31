import 'package:flutter/material.dart';

final crossBlue = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 246, 117, 153),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    secondary: Color.fromARGB(255, 75, 89, 117),
    onSecondary: Color.fromARGB(255, 255, 255, 255),
    error: Color.fromARGB(255, 184, 27, 44),
    onError: Color.fromARGB(255, 255, 255, 255),
    background: Color.fromARGB(255, 50, 52, 55),
    onBackground: Color.fromARGB(255, 75, 89, 117),
    surface: Color.fromARGB(255, 50, 52, 55),
    onSurface: Color.fromARGB(255, 75, 89, 117),
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 22,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w900,
      color: Color.fromARGB(255, 246, 117, 153),
    ),
    titleMedium: TextStyle(
      fontSize: 19,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.w900,
      color: Color.fromARGB(255, 75, 89, 117),
    ),
    bodyMedium: TextStyle(
      fontSize: 19,
      fontFamily: 'JetBrainsMono',
      color: Color.fromARGB(255, 75, 89, 117),
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontFamily: 'JetBrainsMono',
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 75, 89, 117),
    ),
  ),
);
