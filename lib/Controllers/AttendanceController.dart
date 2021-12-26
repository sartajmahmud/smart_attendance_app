import 'package:mvc_pattern/mvc_pattern.dart';
import '../Repositories/AttedanceRepository.dart';
import '../Models/Attendance.dart';

class AttendanceController extends ControllerMVC{
  AttendanceController(){
    getAttendance();
  }

  List<Attendance> attedances = [];

  void getAttendance() async {
    print('controler func');
    final Stream<Attendance> stream = await getAttendances();
    stream.listen((Attendance _slide) {
      print('salesVisits '+_slide.time);
      setState(() => attedances.add(_slide));
    }, onError: (a) {
      print(a);
    }, onDone: () {});
  }
}