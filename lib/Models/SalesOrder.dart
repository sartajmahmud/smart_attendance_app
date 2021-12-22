import 'package:smart_attendance/Models/Seller.dart';

import 'SalesOrderItem.dart';

import 'Product.dart';
import '../helpers/custom_trace.dart';

class SalesOrder {
  int id;
  int salesman_id;
  int seller_id;
  String reference;
  String order_date;
  String delivery_date;
  Seller seller;
  List<SalesOrderItem> salesOrderItems;
  SalesOrder();

  SalesOrder.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      seller_id = jsonMap['seller_id'];
      salesman_id = jsonMap['salesman_id'];
      reference = jsonMap['reference'];
      order_date = jsonMap['order_date'];
      delivery_date = jsonMap['delivery_date'];
      salesOrderItems = jsonMap['sales_order_item'] != null &&
              (jsonMap['sales_order_item'] as List).length > 0
          ? List.from(jsonMap['sales_order_item'])
              .map((element) => SalesOrderItem.fromJSON(element))
              .toSet()
              .toList()
          : [];
      seller = jsonMap['seller'] != null ? Seller.fromJSON(jsonMap['seller']) : Seller.fromJSON({});
      //product = jsonMap['product'] != null ? Product.fromJSON(jsonMap['product']) : Product.fromJSON({});
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}
