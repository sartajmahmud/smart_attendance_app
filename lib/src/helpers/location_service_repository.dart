import 'dart:async';
import 'dart:io';
import 'dart:isolate';
import 'dart:math';
import 'dart:ui';

import 'package:background_locator/location_dto.dart';
import 'package:foodaholic_rider_app/src/models/driver.dart';
import 'package:foodaholic_rider_app/src/repository/RiderRepository.dart';
import 'package:foodaholic_rider_app/src/repository/user_repository.dart';
import 'package:path_provider/path_provider.dart';

import 'file_manager.dart';

class LocationServiceRepository {
  static LocationServiceRepository _instance = LocationServiceRepository._();

  LocationServiceRepository._();

  factory LocationServiceRepository() {
    return _instance;
  }

  static const String isolateName = 'LocatorIsolate';

  int _count = -1;

  Future<void> init(Map<dynamic, dynamic> params) async {
    print("***********Init callback handler");
    if (params.containsKey('countInit')) {

      dynamic tmpCount = params['countInit'];
      if (tmpCount is double) {
        _count = tmpCount.toInt();
      } else if (tmpCount is String) {
        _count = int.parse(tmpCount);
      } else if (tmpCount is int) {
        _count = tmpCount;
      } else {
        _count = -2;
      }
    } else {
      _count = 0;
    }
    print("$_count");
    await setLogLabel("start");
    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> dispose() async {
    print("***********Dispose callback handler");
    print("$_count");
    await setLogLabel("end");
    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> callback(LocationDto locationDto) async {
    print('$_count location in dart: ${locationDto.toString()}');
    Driver driver=new Driver();
    driver.latitude=locationDto.latitude.toString();
    driver.longitude=locationDto.longitude.toString();
    final update=await UpdateRiderLocation(driver: driver);
    print("this is current user ${driver.latitude.toString()}");
    await setLogPosition(_count, locationDto);
    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(locationDto);
    _count++;
  }

  static Future<void> setLogLabel(String label) async {
    final date = DateTime.now();
    // await FileManager.writeToLogFile(
    //     '------------\n$label: ${formatDateLog(date)}\n------------\n');
  }

  static Future<void> setLogPosition(int count, LocationDto data) async {
    final date = DateTime.now();
    // await FileManager.writeToLogFile(
    //     '$count : ${formatDateLog(date)} --> ${formatLog(data)} --- isMocked: ${data.isMocked}\n');
  }

  static double dp(double val, int places) {
    double mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }

  static String formatDateLog(DateTime date) {
    return date.hour.toString() +
        ":" +
        date.minute.toString() +
        ":" +
        date.second.toString();
  }

  static String formatLog(LocationDto locationDto) {
    return dp(locationDto.latitude, 4).toString() +
        " " +
        dp(locationDto.longitude, 4).toString();
  }

  Future<String> _read() async {
    String text;

      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;
      File file = await File("${tempPath}/log.txt");
      text = await file.readAsString();
      print("this is file $text");

    return text;
  }

  readFilesFromCustomDevicePath() async {
    // Retrieve "External Storage Directory" for Android and "NSApplicationSupportDirectory" for iOS
    Directory directory = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();

    // Create a new file. You can create any kind of file like txt, doc , json etc.
    File file = await File("${directory.path}/log.txt");

    // Read the file content
    String fileContent = await file.readAsString();
    print("fileContent : ${fileContent}");
  }

}
