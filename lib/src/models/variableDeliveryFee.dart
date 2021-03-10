
import 'package:foodaholic_rider_app/src/helpers/custom_trace.dart';
//
// class VariableDeliveryFee{
//   double serviceCharge;
//   double perKiloFee;
//   String status;
//
//   VariableDeliveryFee();
//
//   VariableDeliveryFee.fromJSON(Map<String,dynamic> jsonMap){
//     try{
//       serviceCharge = jsonMap['service_charge'] != null ? double.parse(jsonMap['service_charge'].toString()) : 0.0;
//       perKiloFee = jsonMap['per_kilometer_delivery_fee'] != null ? double.parse(jsonMap['per_kilometer_delivery_fee'].toString())  : 0.0;
//       status=jsonMap['delivery_charge_enabled'] !=null ? jsonMap['delivery_charge_enabled'] : '';
//     }catch(e){
//       print(CustomTrace(StackTrace.current, message: e));
//     }
//   }
// }