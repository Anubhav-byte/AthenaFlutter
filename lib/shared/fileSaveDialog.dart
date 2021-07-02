import 'package:athena/file_handler/fileOperation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';


class DialogBox{
  TextEditingController fileName = TextEditingController();
  Widget dialogBox(BuildContext context,String data,int option){


    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(8.0)
          )
      ),

      child: Container(
        height: 245.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child:AppBar(
                  title: Text('Save File',
                    style: GoogleFonts.comfortaa(
                      textStyle:  TextStyle(
                      color: Colors.teal[300],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0
                      ),
                    ),
                  ),
                  centerTitle: true,

                )
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0,top:8,right: 10),
              child: SizedBox(
                width: 320,
                child: TextField(
                  controller: fileName,
                  decoration: InputDecoration(
                      labelText: "File Name",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              style: BorderStyle.solid
                          )
                      ),

                  ),

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonBar(
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text("CANCEL",
                      style: TextStyle(
                        color: Colors.teal[300]
                      ),
                    )
                  ),
                  ElevatedButton(
                      onPressed: (){
                        print(fileName.text);
                        //_saveFile(data,fileName.text);
                        if(fileName.text != ''){

                          if(option == 0){
                            FileOperation().saveTxtFile(data, fileName.text);
                          }
                          else{
                            FileOperation().saveAudioFile(data, fileName.text);
                          }

                          Navigator.pop(context);

                        }else{

                          Toast.show("Enter a file name", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                        }


                      }, child: Text("SAVE")
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  validateName() {
    if(fileName.text == ''){
      return false;
    }
    return true;
  }


}