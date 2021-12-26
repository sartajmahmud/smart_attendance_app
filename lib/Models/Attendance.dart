import '../helpers/custom_trace.dart';

class Attendance{
  int id;
  int user_id;
  double latitude;
  double longitude;
  String time;

  Attendance();

  Attendance.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      user_id = jsonMap['user_id'];
      latitude = jsonMap['latitude'];
      longitude = jsonMap['longitude'];
      time = jsonMap['created_at'];
    } catch (e) {
      // id = 0;
      // name = '';
      // media = new Media();
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}