import 'package:foodaholic_rider_app/src/models/Earning.dart';

import '../helpers/custom_trace.dart';
import '../models/address.dart';
import '../models/food_order.dart';
import '../models/order_status.dart';
import '../models/payment.dart';
import '../models/user.dart';

class Order {
  String id;
  List<FoodOrder> foodOrders;
  OrderStatus orderStatus;
  double tax;
  double deliveryFee;
  String hint;
  DateTime dateTime;
  User user;
  Payment payment;
  Address deliveryAddress;
  double latitude;
  double longitude;
  int cashbackusage;
  bool active;
  Earning earning;

  Order();

  Order.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'].toString();
      tax = jsonMap['tax'] != null ? jsonMap['tax'].toDouble() : 0.0;
      deliveryFee = jsonMap['delivery_fee'] != null ? jsonMap['delivery_fee'].toDouble() : 0.0;
      hint = jsonMap['hint'].toString();
      latitude=double.parse(jsonMap['latitude'])  != null ? double.parse(jsonMap['latitude'])  : 0.0;
      longitude=double.parse(jsonMap['longitude'])  != null ? double.parse(jsonMap['longitude']) : 0.0;
      //cashbackusage=int.parse(jsonMap['cashback_usage'])  != null ? int.parse(jsonMap['cashback_usage'])  : 0;
      active = jsonMap['active'] ?? false;
      orderStatus = jsonMap['order_status'] != null ? OrderStatus.fromJSON(jsonMap['order_status']) : new OrderStatus();
      dateTime = DateTime.parse(jsonMap['updated_at']);
      user = jsonMap['user'] != null ? User.fromJSON(jsonMap['user']) : new User();
      payment = jsonMap['payment'] != null ? Payment.fromJSON(jsonMap['payment']) : new Payment.init();
      deliveryAddress = jsonMap['delivery_address'] != null ? Address.fromJSON(jsonMap['delivery_address']) : new Address();
      earning = jsonMap['earring'] != null ? Earning.fromJSON(jsonMap['earring']) : new Earning();
      foodOrders = jsonMap['food_orders'] != null ? List.from(jsonMap['food_orders']).map((element) => FoodOrder.fromJSON(element)).toList() : [];
    } catch (e) {
      id = '';
      tax = 0.0;
      deliveryFee = 0.0;
      hint = '';
      longitude=0.0;
      latitude=0.0;
      cashbackusage=0;
      active = false;
      orderStatus = new OrderStatus();
      dateTime = DateTime(0);
      user = new User();
      payment = new Payment.init();
      deliveryAddress = new Address();
      foodOrders = [];
      print(CustomTrace(StackTrace.current, message: e));
    }
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["user_id"] = user?.id;
    map["order_status_id"] = orderStatus?.id;
    map["tax"] = tax;
    map["delivery_fee"] = deliveryFee;
    map["foods"] = foodOrders.map((element) => element.toMap()).toList();
    map["payment"] = payment?.toMap();
    if (deliveryAddress?.id != null && deliveryAddress?.id != 'null') map["delivery_address_id"] = deliveryAddress.id;
    return map;
  }

  Map deliveredMap() {
    var map = new Map<String, dynamic>();
    map["id"] = id;
    map["order_status_id"] = 5;
    return map;
  }
}