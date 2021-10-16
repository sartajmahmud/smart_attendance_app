import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/UserProfile.dart';
import 'package:smart_attendance/Repositories/SettingsRepostiory.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Views/splash_screen.dart';

import '../Views/home_screen.dart';

class SplashScreenController extends ControllerMVC {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  SplashScreenController() {}
  UserProfile up;
  Future<void> getUserData() async {
    up = await getUserProfile();
  }

  @override
  void initState() {
    super.initState();
    firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    configureFirebase(firebaseMessaging);
    firebaseMessaging.getToken().then((value) => print(value));
  }

  void configureFirebase(FirebaseMessaging _firebaseMessaging) {
    try {
      _firebaseMessaging.configure(
        onMessage: notificationOnMessage,
        onLaunch: notificationOnLaunch,
        onResume: notificationOnResume,
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
      // ignore: avoid_print
      print('Error Config Firebase');
    }
  }

  Future notificationOnResume(Map<String, dynamic> message) async {
    try {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
    } catch (e) {
      print(e);
    }
  }

  Future notificationOnLaunch(Map<String, dynamic> message) async {
    try {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => SplashScreen()));
    } catch (e) {
      print(e);
    }
  }

  Future notificationOnMessage(Map<String, dynamic> message) async {
    await getUserData();
    Fluttertoast.showToast(
      msg: message['notification']['title'],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 6,
    );
    navigatorKey.currentState.push(
        MaterialPageRoute(builder: (BuildContext context) => HomeScreen(up)));
  }
}
