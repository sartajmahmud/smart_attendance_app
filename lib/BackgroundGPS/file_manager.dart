import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';

class FileManager {

  static Future<String> readLogFile() async {
    final file = await _getTempLogFile();
    return file.readAsString();
  }

  static Future<File> _getTempLogFile() async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/log.txt');
    if (!await file.exists()) {
      await file.writeAsString('');
    }
    return file;
  }



  static Future<void> writeUser() async{
    final file = await _getTempLogFile();
    int userId=currentUser.value.id;
    String name=currentUser.value.name;
    await file.writeAsString("$userId?api_token=$name");
    //print(file.readAsString());
  }

}