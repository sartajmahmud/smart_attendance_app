import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/NotificationList.dart';
import '../Repositories/NotificationRepository.dart';

class NotificationController extends ControllerMVC{

  NotificationController(){
    getNotification();
  }

  List notifications = [];

  void getNotification() async {
    print('controler func');
    final Stream<NotificationList> stream = await getNotifications();
    stream.listen((NotificationList _slide) {
      print('salesVisits '+_slide.notifications.toString());
      setState(() => notifications = _slide as List);
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}