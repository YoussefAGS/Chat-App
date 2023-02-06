import 'package:flutter/material.dart';

import 'colours.dart';

class MyTHemeData {
  static const Color colorwhit = Colors.white;

  static ThemeData lightTheme = ThemeData(
      primaryColor: Praimary_colour,
      scaffoldBackgroundColor: Green_Background,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Praimary_colour,
        onPrimary: Colors.white,
        secondary: Green_colour,
        onSecondary: Colors.black,
        error: Colors.red,
        onError: colorwhit,
        background: Green_Background,
        onBackground: Black_colour,
        surface: Black_colour,
        onSurface: Black_colour,
      ),
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: White_colour)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: White_colour,
        selectedItemColor: Praimary_colour,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: White_colour,
          ),
          subtitle1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Praimary_colour),
          subtitle2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Green_colour),
          bodyText1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
            color: Colors.black,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Praimary_colour,
      ));

  static ThemeData darkTheme = ThemeData(
      primaryColor: Praimary_colour,
      scaffoldBackgroundColor: Praimary_dark,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Praimary_colour,
        onPrimary: Black_colour,
        secondary: Praimary_dark,
        onSecondary: Colors.white,
        error: Colors.red,
        onError: colorwhit,
        background: Praimary_dark,
        onBackground: Black_colour,
        surface: Colors.black,
        onSurface: Colors.black,
      ),
      appBarTheme: AppBarTheme(iconTheme: IconThemeData(color: White_colour)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: White_colour,
        selectedItemColor: Praimary_colour,
        unselectedItemColor: Colors.grey,
      ),
      textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: White_colour,
          ),
          subtitle1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Praimary_colour),
          subtitle2: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Green_colour),
          bodyText1: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          headline2: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          )),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Praimary_colour,
      ));
}
