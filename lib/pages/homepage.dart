import 'package:athena/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: Scaffold(
        appBar: _appBar(),
        body: _getHomeBody(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0,top:25),
        child: Text(
          "Athena",
          style: GoogleFonts.comfortaa(
            textStyle:  TextStyle(
                color: Colors.teal[300],
                fontSize: 29,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0
            ),
          )
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top:17.8,right: 10.0),
          child: IconButton(icon: Icon(Icons.settings,color:Colors.teal[300],size: 30,), onPressed: (){}),
        )
      ],
    );
  }

  _getHomeBody() {
    return Container(
      color: Colors.white,
    );
  }
}
