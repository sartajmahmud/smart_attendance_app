import 'package:foodaholic_rider_app/src/helpers/custom_trace.dart';

class Earning{
  String id;
  String orderId;
  String restaurantEarning;
  String riderEarning;
  String adminEarning;

  Earning();

  Earning.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      orderId = jsonMap['order_id'] != null ? jsonMap['order_id'].toString() : '';
      restaurantEarning = jsonMap['restaurant_earning'] != null ? jsonMap['restaurant_earning'].toString() : '';
      riderEarning=jsonMap['driver_earning'] !=null ? jsonMap['driver_earning'].toString() : '';
      adminEarning=jsonMap['admin_earning'] !=null ? jsonMap['admin_earning'].toString() : '';
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }


}