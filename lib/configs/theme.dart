import 'package:flutter/material.dart';

ThemeData get theme {
  return ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Color(0xffcbc9b7),
    drawerTheme: DrawerThemeData(backgroundColor:Color(0xffd7d6ca) ),
    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xff79430c),
    ),
    cardColor: Color(0xffe3e2e0),
    dialogBackgroundColor:Color(0xffe5e4d6) ,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xffcbc9b7)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(21),
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          const TextStyle(color: Colors.white),
        ),
      ),
    ),
  );
}