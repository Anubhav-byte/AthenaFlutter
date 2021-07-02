import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'fileDatabase.dart';

class FileHelper{
  var tableName = 'file_data';
  var colId = 'id';
  var colFilePath = 'filePath';
  var colFileName = 'fileName';
  var colExtensionName = 'extensionName';

  Future<Database> getDatabase() async {
    var path = join(await getDatabasesPath(), 'file_history.db');
    Database database = await openDatabase(
        path,
        onCreate: (db,version){
          return db.execute('CREATE TABLE $tableName('
              '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
              '$colFileName TEXT,'
              '$colFilePath TEXT,'
              '$colExtensionName TEXT)');
        },
        version: 1
    );
    return database;
  }

  Future<List<FileDatabase>> getFileData() async{
    final Database db = await getDatabase();
    final List<Map<String,dynamic>> maps = await db.query(tableName);
    return List.generate(
        maps.length,
            (index){
              return fileData(index, maps);
            }
    );

  }

  FileDatabase fileData(int index, List<Map<String,dynamic>> maps){
    return FileDatabase(

        fileName: maps[index][colFileName],
        filePath: maps[index][colFilePath],
        extensionName: maps[index][colExtensionName]
    );
  }

  Future<void> insertFileData(FileDatabase fileDataBase) async {
    final Database db = await getDatabase();
    db.insert(tableName, fileDataBase.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace
    );
  }

  Future<void> deleteFileData(String fileName) async {
    final Database db = await getDatabase();
    await db.delete(tableName,where: '$colFileName= ?',whereArgs: [fileName]);
    //await db.rawDelete('DELETE FROM $tableName WHERE $colFileName = $fileName');

  }


}