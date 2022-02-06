import 'Seller.dart';
import '../helpers/custom_trace.dart';

class SalesVisit{
  int id;
  int salesman_id;
  int seller_id;
  String contact_person;
  String contact_detail;
  Seller seller;

  SalesVisit();


  SalesVisit.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      seller_id = jsonMap['seller_id'];
      salesman_id = jsonMap['salesman_id'];
      contact_person = jsonMap['contact_person'];
      contact_detail = jsonMap['contact_detail'];
      seller = seller = jsonMap['seller'] != null ? Seller.fromJSON(jsonMap['seller']) : Seller.fromJSON({});
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}