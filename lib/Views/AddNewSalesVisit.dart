import 'package:flutter/material.dart';

import 'app_text.dart';

class AddNewSalesVisit extends StatefulWidget {
  const AddNewSalesVisit();

  @override
  _AddNewSalesVisitState createState() => _AddNewSalesVisitState();
}

class _AddNewSalesVisitState extends State<AddNewSalesVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
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
            text: "Add New Sales Visit",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
