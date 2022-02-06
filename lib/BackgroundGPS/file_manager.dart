import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../Repositories/UserRepository.dart';

class FileManager {

  static Future<String> readLogFile() async {
    final file = await _getTempLogFile();
    print("readlogfile ${file.path} ${file.readAsString()}");
    return file.readAsString();
  }

  static Future<File> _getTempLogFile() async {
    final directory = await getTemporaryDirectory();
    print(directory.path);
    final file = File('${directory.path}/log.txt');
    print("file.path ${file.path}");
    if (!await file.exists()) {
      print('before write');
      await file.writeAsString('');
      print('after write');
    }
    return file;
  }



  static Future<void> writeUser() async{
    final file = await _getTempLogFile();
    print('writeuser file ${file.path}');
    int userId=currentUser.value.id;
    print('write user id : $userId');
    await file.writeAsString("$userId");
    //print(file.readAsString());
  }

}