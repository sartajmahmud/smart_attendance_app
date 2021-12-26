import 'Notification.dart';
import '../helpers/custom_trace.dart';

class NotificationList{
  List <Notification> notifications = [];

  NotificationList();

  NotificationList.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      notifications = jsonMap['data'] != null &&
          (jsonMap['data'] as List).length > 0
          ? List.from(jsonMap['data'])
          .map((element) => Notification.fromJSON(element))
          .toSet()
          .toList()
          : [];
    } catch (e) {
      // id = 0;
      // name = '';
      // media = new Media();
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}