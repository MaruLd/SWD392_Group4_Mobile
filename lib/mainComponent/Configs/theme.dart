import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return TextTheme(
    bodyText1:TextStyle( color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
  elevation: 0,

  brightness: Brightness.light,
  iconTheme: IconThemeData(color: Colors.black),
  textTheme: TextTheme(
    headline6: TextStyle(color: Color(0xFF8D8D8D), fontSize: 18),
  ),
);
}



