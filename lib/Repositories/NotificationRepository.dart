import 'dart:convert';
import '../Models/NotificationList.dart';
import '../helpers/Helper.dart';
import '../helpers/custom_trace.dart';
import 'package:http/http.dart' as http;

Future<Stream<NotificationList>> getNotifications() async {
  Uri uri = Helper.getUri('api/notifications');
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
        .map((data) => NotificationList.fromJSON(data));

  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new NotificationList.fromJSON({}));
  }
}