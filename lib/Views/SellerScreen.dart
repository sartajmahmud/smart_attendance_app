import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Controllers/SellerController.dart';
import '../Widgets/SellerCardWidget.dart';
import 'app_text.dart';

class SellerScreen extends StatefulWidget {
  const SellerScreen();

  @override
  _SellerScreenState createState() => _SellerScreenState();
}

class _SellerScreenState extends StateMVC<SellerScreen> {
  SellerController _con;
  _SellerScreenState() : super(SellerController()) {
    _con = controller;
  }
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
            text: "Your Sellers",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/addNewSeller');
            },
            child: Text("Add New"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SellerCardWidget(
                  'ABC Company', 'assets/images/Banner_mobil.jpg', 'Uttara, Dhaka', false
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SellerCardWidget(
                  'ABC Company', 'assets/images/Banner_mobil.jpg', 'Uttara, Dhaka', false
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SellerCardWidget(
                  'ABC Company', 'assets/images/Banner_mobil.jpg', 'Uttara, Dhaka', false
              ),
            ),
          ],
        ),
      ),
    );
  }
}
