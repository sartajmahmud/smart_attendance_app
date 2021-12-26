import '../helpers/custom_trace.dart';

class Notification{
  int id;
  int media_id;
  String message;
  bool enable;

  Notification();

  Notification.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      media_id = jsonMap['user_id'];
      message = jsonMap['latitude'];
      enable = jsonMap['longitude'];
    } catch (e) {
      // id = 0;
      // name = '';
      // media = new Media();
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}