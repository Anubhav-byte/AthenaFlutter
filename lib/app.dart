

import 'package:athena/pages/splash_screen.dart';
import 'package:flutter/cupertino.dart';
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
                borderRadius: BorderRadius.circular(11.0),
                side: BorderSide(
                  width: 0.8,
                  color: Colors.teal[500]
                )
              )
          ),
          elevation: MaterialStateProperty.all(4.0),
          shadowColor: MaterialStateProperty.all(Colors.blueGrey),
          backgroundColor:MaterialStateProperty.all(Colors.teal[300]),
          overlayColor: MaterialStateProperty.all(Colors.white60)
        )
      ),
      textButtonTheme: TextButtonThemeData(
        style:ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.0),
                  side: BorderSide(
                      width: 0.8,
                      color: Colors.teal[500]
                  )
              ),
          ),
          overlayColor: MaterialStateProperty.all(Colors.teal[100])
        ),

      ),


      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }

}
