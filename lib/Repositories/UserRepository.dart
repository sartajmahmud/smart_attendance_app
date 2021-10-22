import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_attendance/BackgroundGPS/file_manager.dart';
import 'package:smart_attendance/Configs/Server.dart';
import 'package:smart_attendance/Models/User.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:smart_attendance/Models/UserProfile.dart';
import 'package:intl/intl.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
ValueNotifier<User> currentUser = new ValueNotifier(User());

String ServerUrl = getServerUrl();

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
  print("This is Register body ${json.encode(user.signUpMap())}");
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(user.signUpMap()),
  );
  print("This is Register $url");
  print("This is Register body ${json.encode(user.signUpMap())}");
  print("this is Register response ${response.body}");
  if (response.statusCode == 200) {
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body));
  } else {
    print(response.body.toString());
    //throw new Exception(response.body);
  }
  return currentUser.value;
}

void setCurrentUser(jsonString) async {
  print("jsonstring" + jsonString.toString());
  print("this is current user ");
  try {
    if (json.decode(jsonString) != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(
          'current_user', json.encode(json.decode(jsonString)));
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
    currentUser.value =
        User.fromJSON(json.decode(await prefs.get('current_user')));
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

Future<UserProfile> getUserProfile() async {
  final String url = '$ServerUrl/homescreendata/${currentUser.value.id}';
  print(url);
  final client = new http.Client();
  final response = await client.get(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );

  print("This is UserProfile $url");
  print("this is UserProfile response ${response.body}");
  if (response.statusCode == 200) {
    return UserProfile.fromJSON(json.decode(response.body));
  } else {
    print(response.body.toString());
    throw new Exception(response.body);
  }
}

Future<String> entryAttendance() async {
  //print(currentUser.value.id);
  DateTime now = DateTime.now();
  print(now.hour);
  if(now.hour <13){
    String formattedDate = DateFormat('y-M-d kk:mm:ss').format(now);
    Map toMap() {
      var map = new Map<String, dynamic>();
      map['user_id'] = 1;
      map['entry_time'] = formattedDate;
      return map;
    }

    final String url = '$ServerUrl/entry';
    print("This is entry body ${json.encode(toMap())}");
    final client = new http.Client();
    final response = await client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(toMap()),
    );
    print("This is entry $url");
    print("This is entry body ${json.encode(toMap())}");
    print("this is entry response ${response.body}");
    return jsonDecode(response.body)['message'];
  }else if (now.hour >12) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('y-M-d kk:mm:ss').format(now);
    Map toMap() {
      var map = new Map<String, dynamic>();
      map['user_id'] = 1;
      map['exit_time'] = formattedDate;
      return map;
    }

    final String url = '$ServerUrl/entry';
    print("This is exit body ${json.encode(toMap())}");
    final client = new http.Client();
    final response = await client.post(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(toMap()),
    );
    print("This is exit $url");
    print("This is exit body ${json.encode(toMap())}");
    print("this is exit response ${response.body}");
    return jsonDecode(response.body)['message'];
  }

}

Future <String> attendance(double latitude, double longitude, {String wifiName}) async {
  print('attendance func');
  String userID = await FileManager.readLogFile();
  print('userID $userID');
 // print(wifiName);
  var wifiName = await WifiInfo().getWifiName();
  print("repo wifi ssid: $wifiName");
  Map toMap() {
    var map = new Map<String, dynamic>();
    map['user_id'] = userID;
    map['latitude'] = latitude;
    map['longitude'] = longitude;
    map['ssid'] = wifiName;
    return map;
  }

  final String url = '$ServerUrl/attendance';
  print("This is attendance body ${json.encode(toMap())}");
  final client = new http.Client();
  final response = await client.post(
    url,
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    body: json.encode(toMap()),
  );
  print("This is attendance $url");
  print("This is attendance body ${json.encode(toMap())}");
  print("this is attendance response ${response.body}");
  return jsonDecode(response.body)['message'];
}

