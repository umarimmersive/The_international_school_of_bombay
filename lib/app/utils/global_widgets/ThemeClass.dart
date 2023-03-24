/*
import 'package:flutter/material.dart';


class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  bool get isDarkMode =>ThemeMode == ThemeMode.dark;
}

class ThemeClass{

  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.light(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
      )
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      colorScheme: ColorScheme.dark(),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.black,
      )
  );




}*/
// Flutter imports:
import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    splashColor: Colors.black,
    scaffoldBackgroundColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: Color(0xff0D0B21),
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionHandleColor: Color(0xff2a6099),
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
      color: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.grey,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10,
      backgroundColor: Colors.white,
      selectedLabelStyle:
      TextStyle(color: Colors.black, fontFamily: 'Roboto', fontSize: 14.0),
      unselectedLabelStyle: TextStyle(
          color: Colors.grey[600], fontFamily: 'Roboto', fontSize: 12.0),
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.black),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey[600],
      ),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor:Color(0xFF212121),
    primaryColor: Color(0xff000000),
    splashColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white),
        color: Colors.grey[850]),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionHandleColor: Color(0xff2a6099),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xff2a6099),
      disabledColor: Colors.grey,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 10,
      /*   selectedLabelStyle:
          TextStyle(color: Colors.white, fontFamily: 'Roboto', fontSize: 14.0),
      unselectedLabelStyle:
          TextStyle(color: Colors.grey, fontFamily: 'Roboto', fontSize: 12.0),
     */
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.white),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
  );
}
