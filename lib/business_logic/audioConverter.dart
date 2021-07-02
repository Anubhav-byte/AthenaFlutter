import 'package:flutter/services.dart';

class AudioConverter{

  static const platform = const MethodChannel('com.anubhav.dev/tts');




  Future<void> play(String data) async {

    try{
      int response = await platform.invokeMethod('playAudio',{"data":data});
      print('$response');
    }catch(e){
      print('$e');
    }

  }

  Future<void> stop() async {
    try{
      int response = await platform.invokeMethod('stopAudio');
      print('$response');
    }catch(e){
      print('$e');
    }

  }

}