import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileChooser{
  Future<File> pickTextFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['txt']
    );
    if(result != null){
      return File(result.files.single.path);
    }
    else{
      print("Invalid req");
      return null;
    }
  }
}