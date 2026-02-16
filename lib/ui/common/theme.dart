import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF2C2C2C),
      primary: const Color(0xFF2C2C2C),
      surface: const Color(0xFFF8F8F4),
      secondary: const Color(0xFFC4A053),
      brightness: Brightness.light,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.2,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: Colors.black54,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.black45,
      ),
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: Colors.grey,
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F8F4),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF8F8F4),
      foregroundColor: Color(0xFF2C2C2C),
      elevation: 0,
      centerTitle: false,
    ),
    dividerColor: const Color(0xFFE0E0E0),
    cardColor: const Color(0xFFFFFFFF),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1A1A2E),
      primary: const Color(0xFFC4A053),
      surface: const Color(0xFF16213E),
      secondary: const Color(0xFFC4A053),
      brightness: Brightness.dark,
      onSurface: const Color(0xFFE4E4E4),
      onPrimary: const Color(0xFF1A1A2E),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -0.5,
        color: Color(0xFFFFFFFF),
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE4E4E4),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        height: 1.2,
        color: Color(0xFFFFFFFF),
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Color(0xFFE4E4E4),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 1.6,
        color: Color(0xFFB8B8B8),
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        height: 1.5,
        color: Color(0xFF9E9E9E),
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Color(0xFF8E8E8E),
      ),
      labelLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.1,
        color: Color(0xFFC4A053),
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: Color(0xFF7A7A7A),
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFF1A1A2E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF1A1A2E),
      foregroundColor: Color(0xFFFFFFFF),
      elevation: 0,
      centerTitle: false,
    ),
    dividerColor: const Color.fromARGB(255, 92, 112, 132),
    cardColor: const Color(0xFF16213E),
  );
}
