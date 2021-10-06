import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/User.dart';
import 'package:smart_attendance/Models/UserProfile.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Views/home_screen.dart';
import 'package:smart_attendance/Widgets/CircularLoadingWidget.dart';
import '../Repositories/UserRepository.dart' as repository;
import 'package:flutter/material.dart';

class UserController extends ControllerMVC{
  User user = new User();
  FirebaseMessaging _firebaseMessaging;
  OverlayEntry loader;
  final spinkit = SpinKitRotatingCircle(   color: Colors.white,   size: 50.0, );

  UserController(){
    loader = overlayLoader(context);
    _firebaseMessaging = FirebaseMessaging();
    _firebaseMessaging.getToken().then((String deviceToken) {
      user.device_token = deviceToken;
  });
        }

  static OverlayEntry overlayLoader(context) {
    OverlayEntry loader = OverlayEntry(builder: (context) {
      final size = MediaQuery.of(context).size;
      return Positioned(
        height: size.height,
        width: size.width,
        top: 0,
        left: 0,
        child: Material(
          color: Theme.of(context).primaryColor.withOpacity(0.85),
          child: CircularLoadingWidget(height: 200),
        ),
      );
    });
    return loader;
  }

  UserProfile up;
  Future<void> getUserData() async {
    up = await getUserProfile();
  }

  Future<void> login() async{
    //Overlay.of(context).insert(loader);
    spinkit;
    await repository.login(user).then((value) async{
      if (value != null) {

        await getUserData();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(up)));
      }
    }).catchError((e) async{

      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text("Wrong mobile number or password"),
      // ));
    });
  }

  Future<void> register() async {
    //Overlay.of(context).insert(loader);
    spinkit;
      repository.register(user).then((value) async  {
        if (value != null ) {
          print(value.name);
            print(value.id);
            await getUserData();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen(up)));
        }
      }).catchError((e) {

      }).whenComplete(() {
      });
    }


}