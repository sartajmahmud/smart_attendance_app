import 'package:flutter/material.dart';
import 'package:smart_attendance/Models/Location.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_attendance/Repositories/UserRepository.dart';

String ServerUrl = "http://192.168.1.7:8080/api";

Future<Location> getLocation() async {

  final String url = '$ServerUrl/location/${currentUser.value.location_id}';
  final client = new http.Client();
  final response = await client.get(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );

  print("This is Location $url");
  print("this is Location response ${response.body}");
  if (response.statusCode == 200) {
    return Location.fromJSON(json.decode(response.body));
  } else {
    print(response.body.toString());
    throw new Exception(response.body);
  }
}