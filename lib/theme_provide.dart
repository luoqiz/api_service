import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme = AllTheme().darkTheme();

  void setTheme(ThemeData themeData) {
    currentTheme = themeData;
    notifyListeners();
  }
}

class AllTheme {
  ThemeData defaultTheme({Color color}) {
    return ThemeData(
      primaryColor: Colors.cyan,
    );
  }

  ThemeData darkTheme() {
    return ThemeData.dark();
  }

  ThemeData lightTheme() {
    return ThemeData.light();
  }

  ThemeData systemTheme() {
    return ThemeData.light();
  }
}
