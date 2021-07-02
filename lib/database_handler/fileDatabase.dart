class FileDatabase{
  String fileName;
  String filePath;
  String extensionName;

  FileDatabase({this.fileName, this.filePath, this.extensionName});

  Map<String,dynamic> toMap(){
    return{
      'fileName':fileName,
      'filePath':filePath,
      'extensionName':extensionName
    };
  }

}