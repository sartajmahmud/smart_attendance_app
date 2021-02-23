import 'dart:io';

import 'package:foodaholic_rider_app/src/elements/OrderItemWidget.dart';
import 'package:foodaholic_rider_app/src/repository/RiderRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'dart:async';
import '../../generated/l10n.dart';
import '../controllers/order_controller.dart';
import '../elements/EmptyOrdersWidget.dart';
import '../elements/ShoppingCartButtonWidget.dart';

class OrdersWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> parentScaffoldKey;

  OrdersWidget({Key key, this.parentScaffoldKey}) : super(key: key);

  @override
  _OrdersWidgetState createState() => _OrdersWidgetState();
}

class _OrdersWidgetState extends StateMVC<OrdersWidget> {
  OrderController _con;
  int status=1;
  bool isStopped = true; //global
  Timer timer;


  _OrdersWidgetState() : super(OrderController()) {
    _con = controller;
  }

  @override
  void initState() {
    _con.listenForOrders();
    // Timer.periodic(Duration(seconds: 5), (timer) {
    //   print(DateTime.now());
    // });
    _con.listenForStatus().then((value) =>status=int.parse(_con.driver.status) );
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.scaffoldKey,
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.sort, color: Theme.of(context).hintColor),
          onPressed: () => widget.parentScaffoldKey.currentState.openDrawer(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          S.of(context).orders,
          style: Theme.of(context).textTheme.headline6.merge(TextStyle(letterSpacing: 1.3)),
        ),
        actions: <Widget>[
          new ShoppingCartButtonWidget(iconColor: Theme.of(context).hintColor, labelColor: Theme.of(context).accentColor),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _con.refreshOrders,
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10),
          children: <Widget>[
            ListTile(title: Text("Status"),
              trailing: ToggleSwitch(
                minWidth: 90.0,
                initialLabelIndex: status,
                cornerRadius: 20.0,
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.grey,
                inactiveFgColor: Colors.white,
                labels: ['Active', 'Inactive'],
                icons: [Icons.check,Icons.close],
                activeBgColors: [Colors.green, Colors.red],
                onToggle: (index) {
                  print('switched to: $index');
                  if(index==0){
                    _con.driver.status="0";
                    _con.updateStatus();
                    status=int.parse(_con.driver.status);
                    timer = Timer.periodic(Duration(seconds: 5), (timer) {
                      _con.updateRiderlocation();
                    });
                  }
                  else {
                    timer.cancel();
                    _con.driver.status="1";
                    isStopped=true;
                    _con.updateStatus();
                    status=int.parse(_con.driver.status);
                  }
                },
              ),


            ),
            _con.orders.isEmpty
                ? EmptyOrdersWidget()
                : ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _con.orders.length,
                    itemBuilder: (context, index) {
                      var _order = _con.orders.elementAt(index);
                      return OrderItemWidget(expanded: index == 0 ? true : false, order: _order);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
