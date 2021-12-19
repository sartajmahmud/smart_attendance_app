import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/User.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Views/DashboardScreen.dart';
import 'package:smart_attendance/Views/home_screen.dart';
import '../Repositories/UserRepository.dart' as repository;
import 'package:flutter/material.dart';

class UserController extends ControllerMVC {
  User user = new User();
  FirebaseMessaging _firebaseMessaging;
  OverlayEntry loader;
  final spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );

  UserController() {
    _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((String deviceToken) {
      user.device_token = deviceToken;
    });
  }


  Future<void> login() async {
    spinkit;
    await repository.login(user).then((value) async {
      if (value != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardScreen()));
      }
    }).catchError((e) async {
      print(e);
    });
  }

  Future<void> register() async {
    spinkit;
    repository
        .register(user)
        .then((value) async {
          if (value != null) {
            print(value.name);
            print(value.id);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DashboardScreen()));
          }
        })
        .catchError((e) {})
        .whenComplete(() {});
  }
}
