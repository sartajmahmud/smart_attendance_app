
import 'package:flutter/material.dart';

import 'app_text.dart';

class AddNewSalesOrder extends StatefulWidget {
  const AddNewSalesOrder();

  @override
  _AddNewSalesOrderState createState() => _AddNewSalesOrderState();
}

class _AddNewSalesOrderState extends State<AddNewSalesOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: EdgeInsets.only(left: 25),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        title: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: AppText(
            text: "Add New Sales Order",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        child: Text('Add New Sales Screen'),
      ),
    );
  }
}
