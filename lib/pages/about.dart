import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
class About extends StatefulWidget {
  const About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {

  @override
  void initState() {

    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _webView(),
    );
  }

  _appBar() {
    return AppBar(
      title: Text(
          "Know The Developer",
          style: GoogleFonts.comfortaa(
            textStyle:  TextStyle(
                color: Colors.teal[300],
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0
            ),
          )
      ),
      centerTitle: true,
    );
  }

  _webView() {
    return WebView(
      initialUrl:'https://anubhav-byte.github.io/Anubhav-byte/' ,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}

