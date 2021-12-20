import 'dart:convert';
import '../BackgroundGPS/file_manager.dart';
import '../helpers/custom_trace.dart';
import '../Models/AssignedSeller.dart';
import '../helpers/Helper.dart';
import 'package:http/http.dart' as http;

Future<Stream<AssignedSeller>> getAssignedSellers() async {
  String userID = await FileManager.readLogFile();
  Uri uri = Helper.getUri('api/assignedsellers/1');
  print(uri.toString());
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("this is getFlashSalesProducts $uri");
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => AssignedSeller.fromJSON(data));

  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new AssignedSeller.fromJSON({}));
  }
}