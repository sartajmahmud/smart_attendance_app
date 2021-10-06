import 'package:flutter/material.dart';
import 'package:smart_attendance/Models/Location.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String ServerUrl = "http://192.168.1.8:8080/api";

Future<OfficeLocation> getLocation({int id}) async {
  String url;
if(id!=null){
   url = '$ServerUrl/location/$id';
}else{
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

const apiKey = "AIzaSyBzQ7shRAOAFAdZtIpYp9bNnQnFerPgotw";

Future<int> getRouteCoordinates(double userlat,double userlon,double officelat,double officelon) async {

  String url = "https://maps.googleapis.com/maps/api/directions/json?origin=$userlat,$userlon&destination=$officelat,$officelon&key=$apiKey";
  print(url);
  http.Response response = await http.get(url);
  Map values = jsonDecode(response.body);
  print(values);
  int distance=values["routes"][0]["legs"][0]["distance"]['value'];
  return distance;
  // List parts = distance.split(" ");
  // if(parts[1] == 'm'){
  //   double distance2 = double.parse(parts[0].toString());
  //   distance2 = distance2/1000;
  //   return distance2;
  // }else{
  //   double distance2 = double.parse(parts[0].toString());
  //   return distance2;
  // }

}