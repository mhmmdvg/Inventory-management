import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData theme() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: appBarTheme(),
      primaryTextTheme: textTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

TextTheme textTheme() {
  return TextTheme(
      headline6: TextStyle(
      color: Color(0xFF8B8B8B),
      fontSize: 18,
      ),
    );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
  );
}
