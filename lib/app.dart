

import 'package:athena/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AthenaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Athena',
      theme: _themeData(),
      initialRoute:'/splashScreen',
      routes: {
        '/splashScreen': (BuildContext context) => SplashScreen()
      },
    );
  }

  _themeData() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.teal[300],
      backgroundColor: Colors.white,

      elevatedButtonTheme: ElevatedButtonThemeData(

        style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(19.0),
                side: BorderSide(
                  width: 0.8,
                  color: Colors.teal[500]
                )
              )
          ),
          backgroundColor:MaterialStateProperty.all(Colors.teal[300]),
          overlayColor: MaterialStateProperty.all(Colors.white60)
        )
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),

    );
  }

}
