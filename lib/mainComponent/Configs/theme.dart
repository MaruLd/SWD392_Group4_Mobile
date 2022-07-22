import 'package:evsmart/screens/constraint.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    // toolbarTextStyle: TextTheme(
    //   headline6: TextStyle(color: Color(0xFF8D8D8D), fontSize: 18),
    // ),
    // titleTextStyle: TextTheme(
    //   headline6: TextStyle(color: Color(0xFF8D8D8D), fontSize: 18),
    // ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );
}
