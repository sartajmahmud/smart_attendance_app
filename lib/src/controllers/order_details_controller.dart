import 'package:foodaholic_rider_app/src/repository/DeliveryFee_repository.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

import '../../generated/l10n.dart';
import '../models/order.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../repository/order_repository.dart';

class OrderDetailsController extends ControllerMVC {
  Order order;
  GlobalKey<ScaffoldState> scaffoldKey;
  double base=0;
  double increament=0;
  String FeeStatus;
  double distance=0;
  double deliveryfee=0;

  OrderDetailsController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  Future<void> listenForOrder({String id, String message}) async {
    final Stream<Order> stream = await getOrder(id);
    stream.listen((Order _order) {
      setState(() => order = _order);
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {
      if (message != null) {
        scaffoldKey?.currentState?.showSnackBar(SnackBar(
          content: Text(message),
        ));
      }
    });
  }

  Future<void> refreshOrder() async {
    listenForOrder(id: order.id, message: S.of(context).order_refreshed_successfuly);
  }

  void doDeliveredOrder(Order _order) async {
    deliveredOrder(_order).then((value) {
      setState(() {
        this.order.orderStatus.id = '5';
      });
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text('The order deliverd successfully to client'),
      ));
    });
  }

  Future ListenForDeliveryFeeSettings()async{
    final response=await getVariableFeeSettings();
    setState((){
      base=response.serviceCharge;
      increament=response.perKiloFee;
      FeeStatus=response.status;
    });
    print("this is base $base");
  }

  Future <void> getdistance()async{
    print("get distance ${order.foodOrders[0].food.name}");
    LatLng Restaurant = LatLng(double.parse(order.foodOrders[0].food.restaurant.latitude), double.parse(order.foodOrders[0].food.restaurant.longitude));
    LatLng User = LatLng(order.latitude, order.longitude);
    print("this is lat ${order.foodOrders[0].food.restaurant.latitude}");
    // print("this is  ${carts.elementAt(0).food.name}");
    // LatLng l2 = LatLng(24.370525048488844, 88.6023110305566);
    // LatLng l2 = LatLng(double.parse(carts[0].food.restaurant.latitude), double.parse(carts[0].food.restaurant.longitude));
    final double distanceresponse=await getRouteCoordinates(Restaurant,User);
    print(distanceresponse);
    setState((){
      distance=distanceresponse;
      print("this is distance $distance");
    });
  }

  void CalculateDeliveryfee(){
    setState((){
      deliveryfee=base+(distance*increament);
      //deliveryfee=base+(distance*increament);
      print("this is delivery fee $deliveryfee");
    });
  }

}
