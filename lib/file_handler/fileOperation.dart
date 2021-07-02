import 'dart:io';

import 'package:athena/database_handler/fileDatabase.dart';
import 'package:athena/database_handler/fileHelper.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class FileOperation{

  static const platform = const MethodChannel('com.anubhav.dev/tts');

  FileHelper fileHelper = FileHelper();
  Future<void> saveTxtFile(String data , String fileName) async {
      final directory = await getApplicationDocumentsDirectory();
      var path = '${directory.path}/$fileName.txt';
      File file = File(path);
      file.writeAsString(data);
      FileDatabase fileDatabase = FileDatabase(
          fileName: fileName,
          filePath: path,
          extensionName: 'txt'
      );
      fileHelper.insertFileData(fileDatabase);
  }

  Future<void> saveAudioFile(String data , String fileName) async {
    String path;
    try{
      path = await platform.invokeMethod('exportFile',{"data":data,"fileName":fileName});
      print('$path');
    }catch(e){
    print('$e');
    }
    FileDatabase fileDatabase = FileDatabase(
      fileName: fileName,
      filePath: path,
      extensionName: 'mp3'
    );
    fileHelper.insertFileData(fileDatabase);

  }

  Future<void> deltTxtFile(String filePath) async {
    File file = File(filePath);
    file.delete();
  }

}