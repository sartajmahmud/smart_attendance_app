import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:smart_attendance/Controllers/NetworkController.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';


class HomeScreenController extends ControllerMVC {
  HomeScreenController();

  Future<void>Refresh() async{

  }
  Future<void> Entry(int attendance_type) async {
    print(attendance_type);
    if(attendance_type==1){
      //entry with network logic
      var wifiBSSID = await WifiInfo().getWifiBSSID();
      var wifiIP = await WifiInfo().getWifiIP();
      var wifiName = await WifiInfo().getWifiName();
      print(wifiBSSID);
      print(wifiIP);
      print(wifiName);
      NetworkController nc = new NetworkController();
          await nc.getNW();
          String userSSID = nc.network.ssid;
          if(userSSID!=null) {
            if (userSSID == wifiName) {
              print("Network attendance successful");
            } else {
              print("You are out of network");
            }
          }

    }else{
      //entry with location logic
    }
  }
  Future<void> Exit(int attendance_type) async {
    print(attendance_type);
    if(attendance_type==1){
      //entry with network logic
      var wifiBSSID = await WifiInfo().getWifiBSSID();
      var wifiIP = await WifiInfo().getWifiIP();
      var wifiName = await WifiInfo().getWifiName();
      print(wifiBSSID);
      print(wifiIP);
      print(wifiName);
    }else{
      //entry with location logic
    }
  }
}