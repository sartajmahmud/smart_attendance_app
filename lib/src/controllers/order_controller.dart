import 'package:foodaholic_rider_app/src/helpers/GeoLocator.dart';
import 'package:foodaholic_rider_app/src/models/driver.dart';
import 'package:foodaholic_rider_app/src/models/statistic.dart';
import 'package:foodaholic_rider_app/src/repository/RiderRepository.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../repository/dashboard_repository.dart';
import '../../generated/l10n.dart';
import '../models/order.dart';
import '../repository/order_repository.dart';



class OrderController extends ControllerMVC {
  List<Order> orders = <Order>[];
  GlobalKey<ScaffoldState> scaffoldKey;
  Driver driver;
  int RiderStatus;
  double latitude;
  double longitude;
  double base=0;
  double increament=0;
  String FeeStatus;
  double distance;
  double deliveryfee=0;
  List<Statistic> statistics = <Statistic>[];
  List<Statistic> statistics1 = <Statistic>[];

  OrderController() {
    this.scaffoldKey = new GlobalKey<ScaffoldState>();
  }

  void listenForStatistics({String message}) async {
    final Stream<Statistic> stream = await getStatistics();
    stream.listen((Statistic _stat) {
      setState(() {
        statistics.add(_stat);
      });
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {});
  }


  void listenForStatisticsFilter({String message,DateTime start,DateTime end}) async {
    final Stream<Statistic> stream = await getStatisticsFilter(start, end);
    statistics1.clear();
    //statistics.removeAt(0);
    stream.listen((Statistic _stat) {
      setState(() {
        statistics1.add(_stat);
        print("this is lenght ${statistics1.length}");
      });
    }, onError: (a) {
      print(a);
      scaffoldKey?.currentState?.showSnackBar(SnackBar(
        content: Text(S.of(context).verify_your_internet_connection),
      ));
    }, onDone: () {});
  }


  void listenForOrders({String message}) async {
    final Stream<Order> stream = await getOrders();
    stream.listen((Order _order) {
      setState(() {
        orders.add(_order);
      });
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


  void listenForOrdersHistory({String message}) async {
    final Stream<Order> stream = await getOrdersHistory();
    stream.listen((Order _order) {
      setState(() {
        orders.add(_order);
      });
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

  Future<void> refreshOrdersHistory() async {
    orders.clear();
    listenForOrdersHistory(message: S.of(context).order_refreshed_successfuly);
  }

  Future<void> refreshOrders() async {
    orders.clear();
    listenForOrders(message: S.of(context).order_refreshed_successfuly);
    listenForStatistics();
  }

 Future <void> listenForStatus()async{
   final Driver = await GetRider();
    print(Driver.status);
   setState((){
     this.driver=Driver;
   });
  }

  Future<void> updateStatus()async{
    final response=await UpdateRiderStatus(driver: driver);
    setState((){
      this.RiderStatus=response;
    });
  }

  Future<void> updateRiderlocation()async{
   final location=await determinePosition();
   final update=await UpdateRiderLocation(driver: location);
   print(location.latitude);
  }

  // Future ListenForDeliveryFeeSettings()async{
  //   final response=await getVariableFeeSettings();
  //   setState((){
  //     base=response.serviceCharge;
  //     increament=response.perKiloFee;
  //     FeeStatus=response.status;
  //   });
  //   print("this is base $base");
  // }

  // Future <void> getdistance()async{
  //   LatLng Restaurant = LatLng(double.parse(orders.elementAt(0).foodOrders[0].food.restaurant.latitude), double.parse(orders.elementAt(0).foodOrders[0].food.restaurant.longitude));
  //   LatLng User = LatLng(orders.elementAt(0).latitude, orders.elementAt(0).longitude);
  //   print("this is lat ${orders.elementAt(0).foodOrders[0].food.restaurant.latitude}");
  //   // print("this is  ${carts.elementAt(0).food.name}");
  //   // LatLng l2 = LatLng(24.370525048488844, 88.6023110305566);
  //   // LatLng l2 = LatLng(double.parse(carts[0].food.restaurant.latitude), double.parse(carts[0].food.restaurant.longitude));
  //   double distanceresponse=await getRouteCoordinates(Restaurant,User);
  //   print(distanceresponse);
  //   setState((){
  //     distance=distanceresponse;
  //     print("this is distance $distance");
  //   });
  // }

  void CalculateDeliveryfee(){
    setState((){
      orders[0].foodOrders[0].food.deliveryfee > 0 ? deliveryfee=orders[0].foodOrders[0].food.deliveryfee : orders[0].foodOrders[0].food.restaurant.deliveryFee > 0 ? deliveryfee= orders[0].foodOrders[0].food.restaurant.deliveryFee : deliveryfee=base+(distance*increament);
      //deliveryfee=base+(distance*increament);
      print("this is delivery fee $deliveryfee");
    });
  }



}


