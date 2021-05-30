import 'dart:io';

import 'package:athena/business_logic/textConvertor.dart';
import 'package:athena/file_handler/chooseimage.dart';
import 'package:athena/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ImageToText extends StatefulWidget {
  @override
  _ImageToTextState createState() => _ImageToTextState();
}

class _ImageToTextState extends State<ImageToText> {
  File _image;
  ChooseImage  chooseImage = ChooseImage();

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blueGrey[300],
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _appBar(),
        body: _imageTextBody(),
        //floatingActionButton:_getFloatingActionMenu() ,
      ),
    );
  }

  //AppBar of Scaffold
  _appBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 11.0,top:25),
        child: Text(
            "Image To Text Converter",
            style: GoogleFonts.comfortaa(
              textStyle:  TextStyle(
                  color: Colors.teal[300],
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0
              ),
            )
        ),
      ),


    );
  }

  //Body of Scaffold Widget
  _imageTextBody() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 27,right: 14.42),
        child: Column(
          children: [
            SizedBox(height: 30,),
            _getFileButtons(),
            SizedBox(height: 30,),
            _previewImage(),
            SizedBox(height: 40.0,),
            _convertButton(),
          ],
    ),
      ),
    );
  }



  _previewImage() {

    return Container(
      height: SizeConfig.blockSizeVertical*100,
      width: SizeConfig.blockSizeHorizontal*100,
      child: _getImage(),
    );
  }

  _getImage(){
    if(_image==null){
      return Image.asset('assets/no-image.png');
    }
    else{
      return Image.file(_image);
    }
  }


  //Buttons
  _getFileButtons() {
    return Row(

      children: [
        SizedBox(
          height: 45,
          width: 155,
          child: TextButton.icon(
              onPressed: () async {
                final _imageFile = await chooseImage.chooseImage(1);
                setState(() {
                  _image = _imageFile;
                });
              },
              icon: Icon(Icons.upload_file,color: Colors.teal[300],),
              label: Text(
                "Upload Image",
                style: TextStyle(
                  color: Colors.teal[300]
                ),
              ),
          ),
        ),
        SizedBox(width: 50 ,),
        SizedBox(
          height: 45,
          width: 165,
          child: TextButton.icon(
              onPressed: () async {
                final _imageFile = await chooseImage.chooseImage(2);
                setState(() {
                  _image = _imageFile;
                });
              },
              icon: Icon(Icons.camera_alt_rounded,color: Colors.teal[300],),
              label: Text("Capture Image",
                style: TextStyle(
                  color: Colors.teal[300]
              ),)
          ),
        ),


      ],
    );
  }
  _convertButton() {
    return SizedBox(
      height: 50,
      width: 185,
      child: ElevatedButton(
          onPressed: () async {
            TextConverter().convertToText(_image);
          },
          child: Text("Convert to Text")
      ),
    );
  }




}
