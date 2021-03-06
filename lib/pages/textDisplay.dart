import 'package:athena/business_logic/audioConverter.dart';
import 'package:athena/shared/fileSaveDialog.dart';
import 'package:athena/size_config.dart';
import 'package:flutter/material.dart';
class TextDisplay extends StatefulWidget {
  final convertedText;
  const TextDisplay({this.convertedText});



  @override
  _TextDisplayState createState() => _TextDisplayState(this.convertedText);
}

class _TextDisplayState extends State<TextDisplay> {
  final convertedText;
  var data;
  var result;
  AudioConverter audioConverter = AudioConverter();

  _TextDisplayState(this.convertedText);
  @override
  Widget build(BuildContext context) {
    data = convertedText.text;
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child:Scaffold(
        appBar: _getAppBar(),
        body: _getBody(),
      )
    );
  }

  _getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      //title: Text("Converted Text",style:Theme.of(context).textTheme.headline5 ,),
      centerTitle: true,
      actions: [
        playButton(),
        stopButton(),
        audioSaveButton(),
        IconButton(icon: Icon(Icons.save), onPressed: (){
          showDialog(context: context,
              builder: (context){
                return DialogBox().dialogBox(context,data,0);
              }
          );
        })
      ],
    );
  }

  _getBody() {
    return Container(
      color: Colors.white,
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(left: 30,top:20),
            child: Text(data,),
          )
      ),
    );
  }

  playButton() {
    return IconButton(
        icon: Icon(Icons.play_arrow_rounded),
        onPressed: (){
          audioConverter.play(data);
        }
        );
  }

  stopButton() {
    return IconButton(
        icon: Icon(Icons.stop),
        onPressed: (){
          audioConverter.stop();
        }
    );
  }

  audioSaveButton() {
    return IconButton(
        icon: Icon(Icons.audiotrack_sharp),
        onPressed: (){
          showDialog(context: context,
              builder: (context){
                return DialogBox().dialogBox(context,data,2);
              }
          );
        });
  }
}
