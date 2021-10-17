import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:background_locator/location_dto.dart';
import 'package:smart_attendance/Models/User.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';

/*
Need to bring user data here -> (id, assigned location and network)
find current user location and network here
post/call api with user id, current time , current location,network
 */


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
    // await setLogLabel("start");
    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> dispose() async {
    print("***********Dispose callback handler");
    print("$_count");
    // await setLogLabel("end");
    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(null);
  }

  Future<void> callback(LocationDto locationDto) async {
    print('$_count location in dart: ${locationDto.toString()}');
    //User user=new User();
   // user.latitude=locationDto.latitude.toString();
    //user.longitude=locationDto.longitude.toString();
    String response = await attendance();
    //final update=await entryAttendance();
    //print("this is current user ${user.latitude.toString()}");
    //  await setLogPosition(_count, locationDto);
    final SendPort send = IsolateNameServer.lookupPortByName(isolateName);
    send?.send(locationDto);
    _count++;

  }

// static Future<void> setLogLabel(String label) async {
//   final date = DateTime.now();
//   // await FileManager.writeToLogFile(
//   //     '------------\n$label: ${formatDateLog(date)}\n------------\n');
// }
//
// static Future<void> setLogPosition(int count, LocationDto data) async {
//   final date = DateTime.now();
//   // await FileManager.writeToLogFile(
//   //     '$count : ${formatDateLog(date)} --> ${formatLog(data)} --- isMocked: ${data.isMocked}\n');
// }
//
// static double dp(double val, int places) {
//   double mod = pow(10.0, places);
//   return ((val * mod).round().toDouble() / mod);
// }
//
// static String formatDateLog(DateTime date) {
//   return date.hour.toString() +
//       ":" +
//       date.minute.toString() +
//       ":" +
//       date.second.toString();
// }
//
// static String formatLog(LocationDto locationDto) {
//   return dp(locationDto.latitude, 4).toString() +
//       " " +
//       dp(locationDto.longitude, 4).toString();
// }
}