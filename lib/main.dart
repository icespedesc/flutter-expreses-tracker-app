import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 76, 172, 84));
var kDarkScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 6, 51, 10));

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkScheme.onPrimaryContainer,
          foregroundColor: kDarkScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kDarkScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkScheme.primaryContainer,
            foregroundColor: kDarkScheme.onPrimaryContainer,
            textStyle: TextStyle(
                color: kDarkScheme.secondaryContainer,
                fontWeight: FontWeight.bold),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            labelMedium: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            bodyMedium: TextStyle(color: Colors.white)),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.secondaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.tertiaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            textStyle: TextStyle(
                color: kColorScheme.secondaryContainer,
                fontWeight: FontWeight.bold),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                color: kColorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 14),
            labelMedium: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      ),

      //themeMode: ThemeMode.system, By default.
      home: Expenses(),
    ),
  );
}
