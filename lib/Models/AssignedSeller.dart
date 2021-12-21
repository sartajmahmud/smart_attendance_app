import '../helpers/custom_trace.dart';
import 'Seller.dart';
import 'User.dart';

class AssignedSeller{
  int id;
  int user_id;
  int seller_id;
  User user;
  Seller seller;

  AssignedSeller.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      id = jsonMap['id'];
      user_id = jsonMap['user_id'];
      seller_id = jsonMap['seller_id'];
      seller = jsonMap['seller'] != null ? Seller.fromJSON(jsonMap['seller']) : Seller.fromJSON({});
      user = jsonMap['user'] != null ? User.fromJSON(jsonMap['user']) : User.fromJSON({});

    } catch (e) {
      print(CustomTrace(StackTrace.current, message: e));
    }
  }
}