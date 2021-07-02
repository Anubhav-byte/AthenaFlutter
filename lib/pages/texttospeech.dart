import 'dart:io';

import 'package:athena/business_logic/audioConverter.dart';
import 'package:athena/file_handler/filePicker.dart';
import 'package:athena/shared/fileSaveDialog.dart';
import 'package:athena/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class TextToSpeech extends StatefulWidget {
  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {
  TextEditingController fileTextController ;


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    fileTextController = TextEditingController();
    //fileTextController.text= "Hello world! How it's going buddy? Long time no see. Great to see you Anubhav. I hope you are doing fiine ";

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [

                Colors.teal[100],
                Colors.white
              ],
              begin: Alignment.topLeft,
              end: FractionalOffset(0.3,0.3)
          )
      ),
      width: SizeConfig.blockSizeHorizontal*100,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: _getAppBar(),
        body: _getBody(),
      ),
    );
  }

  _getAppBar() {
    return AppBar(
      title: Padding(
        padding: const EdgeInsets.only(left: 11.0,top:25),
        child: Text(
            "Text to Audio Converter",
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

  _getBody() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            _pickFileButton(),
            SizedBox(height: 20,),
            _textField(),
            SizedBox(height: 10,),
            _mediaButtons(),
            SizedBox(height: 35,),
            _getAudioButton()
          ]

        ),
      ),
    );
  }

  Future<void> _getFile() async {
    File file = await  FileChooser().pickTextFile();
    if(file!=null){
      print(file.path);
      var data = await file.readAsString();
      print('$data');
      fileTextController.text = data;
    }
    else{
      print('wrong');
    }
  }

  _pickFileButton() {
    return Align(
      alignment: Alignment.topRight,

      child: Padding(
        padding: const EdgeInsets.only(top: 20,right: 20),
        child: SizedBox(
          height: 45,
          width: 155,
          child: TextButton.icon(
            icon: Icon(Icons.insert_drive_file_rounded,color: Colors.teal[300],),
            label: Text(
                "Pick File",
              style: TextStyle(
                color: Colors.teal[300]
              ),
            ),
            onPressed: (){
              _getFile();
            },
          ),
        ),
      ),
    );
  }

  _textField() {
    return Container(
      height: SizeConfig.blockSizeHorizontal*90,
      width: SizeConfig.screenWidth,
      margin: EdgeInsets.only(left:10,right: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.teal[300],
          width: 1
        ),
        borderRadius: BorderRadius.circular(4),

      ),
      child: SingleChildScrollView(

        child: TextField(
          textAlign: TextAlign.justify,
          controller: fileTextController,
          maxLines: 400,
          cursorColor: Colors.teal[300],
        ),
      ),
    );
  }

  _mediaButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        GestureDetector(
          child: Container(
              child: Icon(CupertinoIcons.stop_circle, color: Colors.teal[300],size: 50,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40)
              ),
             
              ),
            onTap: (){
              AudioConverter audioConverter = AudioConverter();
              audioConverter.stop();
            }
        ),
        SizedBox(width: 20,),
        GestureDetector(
          child: Container(
              child: Icon(CupertinoIcons.play_circle,
                color: Colors.teal[300],
                size: 50,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40)
              ),
          ),
            onTap: (){
              AudioConverter audioConverter = AudioConverter();
              audioConverter.play(fileTextController.text);
            }
        ),

      ],
    );
  }

  _getAudioButton() {
  return SizedBox(
    height: 50,
    width: 170,
    child: ElevatedButton.icon(
        onPressed: (){

          showDialog(context: context,
              builder: (context){
                return DialogBox().dialogBox(context,fileTextController.text,2);
              }
          );



        },
        icon: Icon(Icons.download_sharp),
        label: Text("Export as Audio")
    ),
  );
  }




}
