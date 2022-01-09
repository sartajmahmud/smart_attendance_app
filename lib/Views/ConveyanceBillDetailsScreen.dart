
import 'package:flutter/material.dart';

import 'app_text.dart';

class ConveyanceBillDetailsScreen extends StatefulWidget {
  const ConveyanceBillDetailsScreen();

  @override
  _ConveyanceBillDetailsScreenState createState() => _ConveyanceBillDetailsScreenState();
}

class _ConveyanceBillDetailsScreenState extends State<ConveyanceBillDetailsScreen> {
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
            text: "Conveyance Bill Details",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
