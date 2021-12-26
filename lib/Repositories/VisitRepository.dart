import 'dart:convert';
import '../helpers/Helper.dart';
import 'package:http/http.dart' as http;
import '../helpers/custom_trace.dart';
import '../Models/SalesVisit.dart';
import '../Models/User.dart';
import 'UserRepository.dart' as userRepo;

Future<Stream<SalesVisit>> getSalesVisits() async {
  User _user = userRepo.currentUser.value;
  Uri uri = Helper.getUri('api/salesvisits/'+_user.id.toString());
  print(uri.toString());
  try {
    final client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    print("this is salesvisit $uri");
    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .map((data) => Helper.getData(data))
        .expand((data) => (data as List))
        .map((data) => SalesVisit.fromJSON(data));

  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new SalesVisit.fromJSON({}));
  }
}