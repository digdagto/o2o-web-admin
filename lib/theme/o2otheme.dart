import 'package:flutter/material.dart';

class O2OTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.green,
      backgroundColor: Colors.white,
      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        bodyText1: TextStyle(fontSize: 16.0),
        bodyText2: TextStyle(fontSize: 14.0),
        overline: TextStyle(fontSize: 16.0, color: Color(0xffe68012))
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.purple,
      accentColor: Colors.amber,
      backgroundColor: Colors.black,
      textTheme: const TextTheme(
        headline1: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
        bodyText1: TextStyle(fontSize: 16.0, color: Colors.white),
        bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
        overline: TextStyle(fontSize: 16.0, color: Color(0xffe68012))

      ),
    );
  }
}

