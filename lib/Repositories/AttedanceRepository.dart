import 'dart:convert';
import '../helpers/custom_trace.dart';
import 'UserRepository.dart' as userRepo;
import '../helpers/Helper.dart';
import 'package:http/http.dart' as http;
import '../Models/Attendance.dart';
import '../Models/User.dart';

Future<Stream<Attendance>> getAttendances() async {
  User _user = userRepo.currentUser.value;
  Uri uri = Helper.getUri('api/attendancerecord/'+_user.id.toString());
  print(uri.toString());
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("this is assignedsellers $uri");
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => Attendance.fromJSON(data));

  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new Attendance.fromJSON({}));
  }
}