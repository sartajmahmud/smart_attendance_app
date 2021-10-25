import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Models/Location.dart';
import 'package:smart_attendance/Models/Network.dart';
import 'package:smart_attendance/Models/UserProfile.dart';
import 'package:smart_attendance/Repositories/NetworkRepository.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:smart_attendance/Repositories/UserRepository.dart';
import 'package:smart_attendance/Repositories/LocationRepository.dart';

class HomeScreenController extends ControllerMVC {
  HomeScreenController();
  OfficeLocation location;
  String RiderStatus;
  Network network;

  getOfficeLocation({int id}) async {
    if (id != null) {
      location = await getLocation(id: id);
    } else {
      location = await getLocation();
    }
  }

  UserProfile up;
  Future<void> getUserData() async {
    up = await getUserProfile();
  }

  Future<void> updateStatus()async{
    //final response=await entryAttendance();
    setState((){
      this.RiderStatus='';
    });
  }

  getOfficeNetwork({int id}) async {
    if (id != null) {
      network = await getNetwork(id: id);
    } else {
      network = await getNetwork();
    }
  }

  Future<LocationData> getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {}
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {}
    }

    return _locationData = await location.getLocation();
  }

  Future<void> Entry(int attendance_type, OfficeLocation x, Network network,
      GlobalKey<ScaffoldState> ScaffoldKey) async {
    print('attendance type = $attendance_type');

    //make sure attendance_type in database -> 1.Location and 2.network
    if (attendance_type == 1) {

      //entry with location logic
      LocationData userlocation = await getCurrentLocation();
      print(userlocation);
      int distance = await getRouteCoordinates(userlocation.latitude,
          userlocation.longitude, x.latitude, x.longitude);
      print(distance);
      print('radius ${x.radius}');
      if (distance < x.radius) {
        String response = await entryAttendance();
        print(response);
        if (response == "already exists") {
          ScaffoldKey?.currentState?.showSnackBar(
              SnackBar(content: Text("Entry Attendance already exists")));
        } else {
          ScaffoldKey?.currentState?.showSnackBar(
              SnackBar(content: Text("Successfully entered your attendance")));
        }
      } else {
        ScaffoldKey?.currentState?.showSnackBar(
            SnackBar(content: Text("You are out of attendance area")));
        print('cant log in out of the area');
      }
    } else {
      //entry with network logic
      var wifiName = await WifiInfo().getWifiName();
      print(wifiName);
      if (wifiName == network.ssid) {
        String response = await entryAttendance();
        if (response == "already exists") {
          ScaffoldKey?.currentState?.showSnackBar(
              SnackBar(content: Text("Entry Attendance already exists")));
        } else {
          ScaffoldKey?.currentState?.showSnackBar(
              SnackBar(content: Text("Successfully entered your attendance")));
        }
      } else {
        ScaffoldKey?.currentState?.showSnackBar(
            SnackBar(content: Text("You are out of your assigned Network")));
        print('cant log in out of the area');
      }
    }
  }

  // Future<void> Exit(
  //     int attendance_type, GlobalKey<ScaffoldState> ScaffoldKey) async {
  //   print(attendance_type);
  //   if (attendance_type == 1) {
  //     String response = await exitAttendance();
  //     if (response == "already exists") {
  //       ScaffoldKey?.currentState?.showSnackBar(
  //           SnackBar(content: Text("Exit Attendance already exists")));
  //     } else {
  //       ScaffoldKey?.currentState?.showSnackBar(SnackBar(
  //           content: Text("Successfully entered your exit attendance")));
  //     }
  //     print(response);
  //   } else {
  //     String response = await exitAttendance();
  //     if (response == "already exists") {
  //       ScaffoldKey?.currentState?.showSnackBar(
  //           SnackBar(content: Text("Exit Attendance already exists")));
  //     } else {
  //       ScaffoldKey?.currentState?.showSnackBar(SnackBar(
  //           content: Text("Successfully entered your exit attendance")));
  //     }
  //   }
  // }
}
