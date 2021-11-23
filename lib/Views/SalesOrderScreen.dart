
import 'package:flutter/material.dart';

import 'app_text.dart';

class SalesOrderScreen extends StatefulWidget {
  const SalesOrderScreen();

  @override
  _SalesOrderScreenState createState() => _SalesOrderScreenState();
}

class _SalesOrderScreenState extends State<SalesOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "Yours Sales Orders",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/addNewSalesOrder');
            },
            child: Text("Add New"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        child: Text('SalesOrderScreen'),
      ),
    );
  }
}
