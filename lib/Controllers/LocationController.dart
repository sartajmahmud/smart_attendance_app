import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/Location.dart';
import 'package:smart_attendance/Views/home_screen.dart';
import '../Repositories/LocationRepository.dart' as repository;
import 'package:flutter/material.dart';

class LocationController extends ControllerMVC{
  OfficeLocation location ;

  void getLoc() async{
    location = await repository.getLocation();
    // repository.getLocation().then((value) async{
    //   if (value != null) {
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
    //   }
    // }).catchError((e) async{

      // scaffoldKey?.currentState?.showSnackBar(SnackBar(
      //   content: Text("Wrong mobile number or password"),
      // ));
    }




}