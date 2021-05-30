import 'package:athena/pages/about.dart';
import 'package:athena/pages/imagetotext.dart';
import 'package:athena/pages/homepage.dart';
import 'package:athena/pages/texttospeech.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigation createState() => _BottomNavigation();
}

class _BottomNavigation extends State<BottomNavigation> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: show(index),
      /* bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,

          showUnselectedLabels: true,
          unselectedItemColor: Colors.blueGrey,
          selectedItemColor: Colors.teal[300],
          iconSize: 30,
          onTap:( (int x){
            setState(
                (){
                  index = x;
                  show(index);
                }
            );
          }),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.camera_viewfinder,), label: "Image To Text"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.speaker_3_fill),label: "Text To Speech"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: "About")
          ],
        ),
      ),*/
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.teal[300],
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.teal[300],
        animationCurve:Curves.ease,
        onTap:( (int x){
          setState(
                  (){
                index = x;
                show(index);
              }
          );
        }),
        items: [
          Icon(Icons.home),
          Icon(CupertinoIcons.camera_viewfinder,),
          Icon(Icons.audiotrack),
          Icon(CupertinoIcons.person)
        ],
      ),
    );
  }

  Widget show(int index){
    switch(index){
      case 0:
        return HomePage();
        break;
      case 1:
        return ImageToText();
        break;
      case 2:
        return TextToSpeech();
        break;
      case 3:
        return About();
        break;
    }
  }
}

