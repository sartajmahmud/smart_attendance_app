import 'dart:io';

import 'package:foodaholic_rider_app/src/repository/user_repository.dart';
import 'package:path_provider/path_provider.dart';

class FileManager {

  // static Future<void> writeToLogFile(String log) async {
  //   final file = await _getTempLogFile();
  //   await file.writeAsString(log, mode: FileMode.append);
  // }

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

  // static Future<void> clearLogFile() async {
  //   final file = await _getTempLogFile();
  //   await file.writeAsString('');
  // }



  static Future<void> writeUser() async{
    final file = await _getTempLogFile();
    String userId=currentUser.value.id;
    String apiToken=currentUser.value.apiToken;
    await file.writeAsString("$userId?api_token=$apiToken");
    //print(file.readAsString());
  }

}


