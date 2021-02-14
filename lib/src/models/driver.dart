

import 'package:deliveryboy/src/helpers/custom_trace.dart';

class Driver{
  String id;
  String User_id;
  String earning;
  String available;
  String latitude;
  String longitude;
  String totalEarning;
  String ServiceCharge;
  String PerKmDeliveryFee;
  String status;
  String totalOrders;
  String deliveryFee;

  Driver();

  Driver.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      User_id= jsonMap['user_id'].toString();
      deliveryFee = jsonMap['delivery_fee'].toString();
      earning=jsonMap['earning'].toString();
      available=jsonMap['available'].toString();
      latitude=jsonMap['latitude'].toString();
      longitude=jsonMap['longitude'].toString();
      totalEarning=jsonMap['total_earning'].toString();
      ServiceCharge=jsonMap['service_charge'].toString();
      PerKmDeliveryFee=jsonMap['per_km_delivery_fee'].toString();
      status=jsonMap['status'].toString();
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map RiderStatus(){
    var map = new Map<String, dynamic>();
    map['status']=status;
    return map;
  }


}