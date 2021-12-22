import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Models/User.dart';
import '../Views/DashboardScreen.dart';
import '../Repositories/UserRepository.dart' as repository;
import 'package:flutter/material.dart';

class UserController extends ControllerMVC {
  User user = new User();
  FirebaseMessaging _firebaseMessaging;
  OverlayEntry loader;
  GlobalKey<ScaffoldState> scaffoldKey;

  final spinkit = SpinKitRotatingCircle(
    color: Colors.white,
    size: 50.0,
  );

  UserController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
    _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((String deviceToken) {
      user.device_token = deviceToken;
    });
  }


  Future<void> login() async {
    spinkit;
    await repository.login(user).then((value) async {
      if (value.name != null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => DashboardScreen()));
      }else{
        String result = await duplicateAC();
        if (result == "true") {
          print("this is duplicate");
          scaffoldKey?.currentState
              ?.showSnackBar(SnackBar(
              content: Text("Incorrect Password")));
        } else {
          scaffoldKey?.currentState
              ?.showSnackBar(SnackBar(
              content: Text('No account is associated with this number. Please sign up. ')));
        }
      }
    }).catchError((e) async {
      print(e);
    });
  }

  Future<String> duplicateAC() async{
    final response=await repository.GetDuplicateAC(user);
    print('duplicate result controller $response');
    String result=response.toString();
    return result;
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
