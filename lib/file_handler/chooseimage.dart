import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ChooseImage{
  File _image;
  final picker = ImagePicker();
  var pickedFile;
  Future<File> chooseImage(int choice) async {
    if(choice ==1)
      pickedFile = await picker.getImage(source: ImageSource.gallery);
    else
      pickedFile = await picker.getImage(source: ImageSource.camera);
    if(pickedFile!=null){
      this._image = File(pickedFile.path);
      return _image;
    }
    else{
      return null;
    }
  }
}