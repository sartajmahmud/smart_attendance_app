import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/User.dart';
import 'package:smart_attendance/Views/home_screen.dart';
import '../Repositories/UserRepository.dart' as repository;
import 'package:flutter/material.dart';

class UserController extends ControllerMVC{
  User user = new User();
  FirebaseMessaging _firebaseMessaging;

  UserController(){
    _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((String deviceToken) {
      user.device_token = deviceToken;
  });
        }

  Future<void> login({UserController con}) async{
    await repository.login(user).then((value) async{
      if (value != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(con: con,)));
      }
    }).catchError((e) async{

      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text("Wrong mobile number or password"),
      // ));
    });
  }

  void register() async {

      repository.register(user).then((value) {
        if (value != null ) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
        }
      }).catchError((e) {

      }).whenComplete(() {
      });
    }


}