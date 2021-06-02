import 'dart:io';

import 'package:athena/database_handler/fileDatabase.dart';
import 'package:athena/database_handler/fileHelper.dart';
import 'package:path_provider/path_provider.dart';

class FileOperation{
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
  Future<void> deltTxtFile(String filePath) async {
    File file = File(filePath);
    file.delete();
  }

}