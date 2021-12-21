import '../helpers/custom_trace.dart';
import 'Product.dart';
import 'Seller.dart';

class Inventory{
  int seller_id;
  int product_id;
  int quantity;
  //Seller seller;
  Product product;


  Inventory.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      seller_id = jsonMap['seller_id'];
      product_id = jsonMap['product_id'];
      quantity = jsonMap['quantity'];
      //seller = jsonMap['seller'] != null ? Seller.fromJSON(jsonMap['seller']) : Seller.fromJSON({});
      product = jsonMap['product'] != null ? Product.fromJSON(jsonMap['product']) : Product.fromJSON({});
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}