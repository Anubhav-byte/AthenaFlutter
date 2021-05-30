import 'dart:io';

import 'package:google_ml_vision/google_ml_vision.dart';

class TextConverter{
  Future<void> convertToText(File _imageFile) async {

    if(_imageFile==null){
      print("NO image input");
    }else{
      final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(_imageFile);
      final TextRecognizer textRecognizer = GoogleVision.instance.textRecognizer();
      final VisionText visionText = await textRecognizer.processImage(visionImage);
      print(visionText.text);
      textRecognizer.close();
    }











  }
}