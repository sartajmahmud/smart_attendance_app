import 'dart:convert';


import 'package:deliveryboy/src/models/variableDeliveryFee.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../repository/settings_repository.dart' as settingRepo;
import '../models/address.dart' as model;


const apiKey = "AIzaSyBzQ7shRAOAFAdZtIpYp9bNnQnFerPgotw";
Future<double> getRouteCoordinates(LatLng restaurant, LatLng User) async {
  String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${User.latitude},${User.longitude}&destination=${restaurant.latitude},${restaurant.longitude}&key=$apiKey";
  print(url);
  http.Response response = await http.get(url);
  Map values = jsonDecode(response.body);
  print(values);
  String distance=values["routes"][0]["legs"][0]["distance"]['text'];
  List parts = distance.split(" ");
  double distance2 = double.parse(parts[0].toString());
  return distance2;
}

Future<VariableDeliveryFee> getVariableFeeSettings() async {

  final String url = 'http://admin.food-aholic.com/api/variable-user-delivery-fee';
  print("This is feeSettings $url");
  http.Response response = await http.get(url);
  print(response.body);
  Map values = jsonDecode(response.body);
  return VariableDeliveryFee.fromJSON(values['data']);


}