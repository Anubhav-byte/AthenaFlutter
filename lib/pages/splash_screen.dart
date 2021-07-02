import 'package:athena/pages/bottomnavigation.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
           SplashScreenView(
             imageSrc:'assets/athena_logo.webp',
             home: BottomNavigation(),
             duration: 3000,
             imageSize: 700,
             text: "",
           ),

    );
  }
}
