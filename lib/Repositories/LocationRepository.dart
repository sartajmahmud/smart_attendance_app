import 'package:smart_attendance/Models/Location.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Configs/Server.dart';

String ServerUrl = getServerUrl();
Future<OfficeLocation> getLocation({int id}) async {
  String url;
  if (id != null) {
    url = '$ServerUrl/location/$id';
  } else {
    url = '$ServerUrl/location/${currentUser.value.location_id}';
  }

  final client = new http.Client();
  final response = await client.get(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );

  print("This is Location $url");
  print("this is Location response ${response.body}");
  if (response.statusCode == 200) {
    return OfficeLocation.fromJSON(json.decode(response.body));
  } else {
    print(response.body.toString());
    throw new Exception(response.body);
  }
}

const apiKey = 'AIzaSyCHZWSE97Js_lHU9UF4OWLuZHcrVeE6Qyo';
Future<int> getRouteCoordinates(
    double userlat, double userlon, double officelat, double officelon) async {
  String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=$userlat,$userlon&destination=$officelat,$officelon&key=$apiKey";
  print(url);
  http.Response response = await http.get(url);
  Map values = jsonDecode(response.body);
  print(values);
  int distance = values["routes"][0]["legs"][0]["distance"]['value'];
  return distance;
}
