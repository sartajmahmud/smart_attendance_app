import 'dart:async';
import 'package:background_locator/location_dto.dart';
import 'package:smart_attendance/BackgroundGPS/file_manager.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'location_service_repository.dart';

class LocationCallbackHandler {
  static var channel;
  static Future<void> initCallback(Map<dynamic, dynamic> params) async {
    print('initcallback print');
    channel = WebSocketChannel.connect(
      Uri.parse('ws://192.168.1.8:5000'),
    );
    LocationServiceRepository myLocationCallbackRepository =
    LocationServiceRepository();
    await myLocationCallbackRepository.init(params);
  }

  static Future<void> disposeCallback() async {
    channel.sink.close();
    LocationServiceRepository myLocationCallbackRepository =
    LocationServiceRepository();
    await myLocationCallbackRepository.dispose();
  }

  static Future<void> callback(LocationDto locationDto) async {
    print('callback print');
    String userID = await FileManager.readLogFile();
    var wifiName = await WifiInfo().getWifiName();
    channel.sink.add("$userID,${locationDto.latitude},${locationDto.longitude},$wifiName");
    LocationServiceRepository myLocationCallbackRepository =
    LocationServiceRepository();
    await myLocationCallbackRepository.callback(locationDto);
  }

  static Future<void> notificationCallback() async {
    print('***notificationCallback');
  }

}