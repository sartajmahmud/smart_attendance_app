import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_attendance/Models/User.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

ValueNotifier<User> currentUser = new ValueNotifier(User());
String ServerUrl = "http://192.168.1.7:8080/api";

Future<User> login(User user) async {
  final String url = '$ServerUrl/login';
  print("This is login body ${json.encode(user.loginMap())}");
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.loginMap()),
  );
  print("This is login $url");
  print("This is login body ${json.encode(user.loginMap())}");
  print("this is login response ${response.body}");
  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body));
    print(currentUser.value.name);
  } else {
    print(response.body.toString());
    throw new Exception(response.body);
  }
  return currentUser.value;
}

Future<User> register(User user) async {
  final String url = '$ServerUrl/register';
  final client = new http.Client();

  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.loginMap()),
  );
  print("This is Register $url");
  print("This is Register body ${json.encode(user.loginMap())}");
  print("this is Register response ${response.body}");
  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body));
  } else {
    print(response.body.toString());
    throw new Exception(response.body);
  }
  return currentUser.value;
}

void setCurrentUser(jsonString) async {
  print("jsonstring" + jsonString.toString());
  print("this is current user ");
  try {
    if (json.decode(jsonString) != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('current_user', json.encode(json.decode(jsonString)));
    }
  } catch (e) {
    print("this is current user catch");
    print(jsonString.toString());
    throw new Exception(e);
  }
}

Future<User> getCurrentUser() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //prefs.clear();
  if (currentUser.value.auth == null && prefs.containsKey('current_user')) {
    currentUser.value = User.fromJSON(json.decode(await prefs.get('current_user')));
    currentUser.value.auth = true;
  } else {
    currentUser.value.auth = false;
  }
  // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
  currentUser.notifyListeners();
  return currentUser.value;
}

Future<void> logout() async {
  currentUser.value = new User();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('current_user');
}

