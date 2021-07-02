import 'dart:ui';

import 'package:athena/database_handler/fileDatabase.dart';
import 'package:athena/database_handler/fileHelper.dart';
import 'package:athena/file_handler/fileOperation.dart';
import 'package:athena/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FileDatabase> listFiles;
  var listCount = 0;
  FileHelper fileHelper = FileHelper();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    getData();
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [

                Colors.teal[100],
                Colors.white
              ],
              begin: Alignment.topLeft,
              end: FractionalOffset(0.4,1)
          )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _appBar(),
        body: _getHomeBody(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0,top:25),
        child: Text(
          "Athena",
          style: GoogleFonts.comfortaa(
            textStyle:  TextStyle(
                color: Colors.teal[300],
                fontSize: 29,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0
            ),
          )
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top:17.8,right: 10.0),
          child: IconButton(icon: Icon(Icons.settings,color:Colors.teal[300],size: 30,), onPressed: (){}),
        )
      ],
    );
  }

  _getHomeBody() {
    return Container(
      color: Colors.transparent,
      width: SizeConfig.screenWidth,
      height: SizeConfig.screenHeight,
      child: ListView.builder(
          itemCount: listCount,
          itemBuilder: (BuildContext context,int index){
            return ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Padding(
                  padding: const EdgeInsets.only(left: 17.0,right: 13.0, bottom:0),
                  child: Card(
                    elevation: 0,

                    child:_getTile(index)
                  ),
                ),
              ),
            );
          }
          ),
    );
  }

  Future<void> getData() async {
    final list = await fileHelper.getFileData();
    setState(() {
      listFiles = list;
      listCount = listFiles.length;
    });
  }

  Future<void> openFile(String filePath) async {
    await OpenFile.open(filePath);
  }

  Future<void> deleteData(String fileName,String filePath) async {
    FileOperation fileOperation = FileOperation();
    fileOperation.deltTxtFile(filePath);
    await fileHelper.deleteFileData(fileName);
    getData();

  }
  
  _getTile(int index){
    return ListTile(
      leading: listFiles[index].extensionName=='txt'?
      CircleAvatar(
        child: Icon(Icons.insert_drive_file_rounded,color: Colors.teal[300],),
        backgroundColor: Colors.white,
      ):
      CircleAvatar(
          child: Icon(Icons.music_note,color: Colors.teal[300],),
          backgroundColor: Colors.grey[100],
      ),
      title: Text(
        '${listFiles[index].fileName}.${listFiles[index].extensionName}',
        style: Theme.of(context).textTheme.subtitle1,
      ),
      trailing: IconButton(icon: Icon(Icons.delete),onPressed: (){ deleteData(listFiles[index].fileName,listFiles[index].filePath);},),
      onTap: (){openFile(listFiles[index].filePath);},

    );
  }
}
