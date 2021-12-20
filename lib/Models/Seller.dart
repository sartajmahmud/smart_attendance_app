import '../helpers/custom_trace.dart';
import 'Inventory.dart';
import 'Media.dart';

class Seller{
  int id;
  String name;
  String phoneNumber;
  String email;
  String address;
  double latitude;
  double longitude;
  int inventory_id;
  int media_id;
  Media media;
  Inventory inventory;

  Seller();

  Seller.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      name = jsonMap['name'];
      phoneNumber = jsonMap['phoneNumber'];
      email = jsonMap['email'];
      address = jsonMap['address'];
      latitude = jsonMap['latitude'];
      longitude = jsonMap['longitude'];
      inventory_id = jsonMap['inventory_id'];
      media_id = jsonMap['media_id'];
      media = jsonMap['media'] != null ? Media.fromJSON(jsonMap['media']) : Media.fromJSON({});
      inventory = jsonMap['inventory'] != null ? Inventory.fromJSON(jsonMap['inventory']) : Inventory.fromJSON({});
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["name"] = name;
    map["phoneNumber"] = phoneNumber;
    return map;
  }


}