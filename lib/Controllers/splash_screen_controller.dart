import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';

class SplashScreenController extends ControllerMVC {
  //ValueNotifier<Map<String, double>> progress = new ValueNotifier(new Map());
  //GlobalKey<ScaffoldState> scaffoldKey;
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging();

  SplashScreenController() {
   // this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  @override
  void initState() {
    super.initState();
    firebaseMessaging.requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
    configureFirebase(firebaseMessaging);
    firebaseMessaging.getToken().then((value) => print(value));

    // Timer(Duration(seconds: 20), () {
    //   scaffoldKey?.currentState?.showSnackBar(const SnackBar(
    //     content: Text("Verify your internet connection"),
    //   ));
    // });
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
      // if (message['data']['id'] == "orders") {
      //   if(currentUser.value.apiToken!=null){
      //     Navigator.pushReplacementNamed('/Pages',arguments: 2);
      //   }
      //   else{
      //     settingRepo.navigatorKey.currentState.pushReplacementNamed('/Login');
      //   }
      //   // settingRepo.navigatorKey.currentState.pushReplacementNamed('/Pages', arguments: 2);
      // } else if (message['data']['id'] == "messages") {
      //   if(currentUser.value.apiToken!=null){
      //     settingRepo.navigatorKey.currentState.pushReplacementNamed('/Pages',arguments: 0);
      //   }
      //   else{
      //     settingRepo.navigatorKey.currentState.pushReplacementNamed('/Login');
      //   }
      //   // settingRepo.navigatorKey.currentState.pushReplacementNamed('/Pages', arguments: 0);
      // }
    } catch (e) {
      print(e);
    }
  }

  Future notificationOnLaunch(Map<String, dynamic> message) async {
    try {
     // // if (messageId != message['google.message_id']) {
     //    //await settingRepo.saveMessageId(message['google.message_id']);
     //    if (message['data']['id'] == "orders") {
     //      //if(currentUser.value.apiToken!=null){
     //       // settingRepo.navigatorKey.currentState.pushReplacementNamed('/Pages',arguments: 2);
     //     // }
     //     // else{
     //        //settingRepo.navigatorKey.currentState.pushReplacementNamed('/Login');
     //     // }
     //      //   settingRepo.navigatorKey.currentState.pushReplacementNamed('/Pages', arguments: 2);
     //    } else if (message['data']['id'] == "messages") {
     //      //if(currentUser.value.apiToken!=null){
     //        // Navigator.pushReplacement('/Pages');
     //      /
     //      else{
     //        // Navigator.pushReplacement('/Pages');
     //      }
     //      // settingRepo.navigatorKey.currentState.pushReplacementNamed('/Pages', arguments: 0);
     //    }
     //  }
    } catch (e) {
      print(e);
    }
  }

  Future notificationOnMessage(Map<String, dynamic> message) async {
    print(message['notification']['title']);
    List parts = message['notification']['title'].toString().split(' ');
    print(parts);
    if(parts[0] == 'Your'){
      // Navigator.pushReplacement('/Pages');
    }
    Fluttertoast.showToast(
      msg: message['notification']['title'],
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 6,
    );
  }

}
