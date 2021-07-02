

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
      //backgroundColor: Colors.white,
      textTheme: TextTheme(
        headline5: TextStyle(
          color: Colors.teal[300]
        ),
        subtitle1: TextStyle(
          color: Colors.teal[300],
          fontSize: 20
        )
      ),
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
          elevation: MaterialStateProperty.all(0.0),
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
      scaffoldBackgroundColor: Colors.transparent,

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.teal[300]
        ),
        elevation: 0,
      ),

      cardTheme: CardTheme(
        color: Colors.grey.shade200.withOpacity(0.5),
        shadowColor: Colors.black,
        elevation: 6,
        margin: EdgeInsets.only(top: 10.1,bottom: 6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        )

      ),




    );
  }

}
