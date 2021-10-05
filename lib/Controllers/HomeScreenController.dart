import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Controllers/NetworkController.dart';
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
  UserProfile up;
  Network network;
  Future<void> getUserData() async {
    up = await getUserProfile();
  }
  getOfficeLocation({int id}) async {
if(id!=null){
  location = await getLocation(id: id);
}else{
  location = await getLocation();
}

  }

  getOfficeNetwork({int id})async{
    if(id!=null){
      network = await getNetwork(id: id);
    }else{
      network = await getNetwork();
    }
  }

  Future<LocationData> getCurrentLocation() async{
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
       // return _locationData;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
    //return _locationData;
      }
    }

    return _locationData = await location.getLocation();

  }
  Future<void> Entry(int attendance_type, OfficeLocation x, Network network) async {
    if(attendance_type==1){
      //entry with location logic
    LocationData userlocation = await getCurrentLocation();
    print(userlocation);
      int distance = await getRouteCoordinates(userlocation.latitude,userlocation.longitude,x.latitude,x.longitude);
    print(distance);
    print('radius ${x.radius}');
      if(distance < x.radius) {
      await entryAttendance();
    }else{
      print('cant log in out of the area');
    }
    }else{
      //entry with network logic
      var wifiName = await WifiInfo().getWifiName();
      print(wifiName);
      if(wifiName == network.ssid){
        await entryAttendance();
      }else{
        print('out of network');
      }


    }
  }
  Future<void> Exit(int attendance_type) async {
    print(attendance_type);
    if(attendance_type==1){

      await exitAttendance();
    }else{

      await exitAttendance();
    }
  }
}