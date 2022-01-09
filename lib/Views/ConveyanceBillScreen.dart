
import 'package:flutter/material.dart';

import 'app_text.dart';

class ConveyanceBillScreen extends StatefulWidget {
  ConveyanceBillScreen();

  @override
  _ConveyanceBillScreenState createState() => _ConveyanceBillScreenState();
}

class _ConveyanceBillScreenState extends State<ConveyanceBillScreen> {
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
            text: "Conveyance Bill",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/addNewConveyanceBill');
            },
            child: Text("Add New"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 5,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, '/conveyanceBillDetailsScreen');
                },
                child: Container(
                  padding:  const EdgeInsets.all(8.0),
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Bill ID # 11'),
                      Text('Amount 1234')
                    ],
                  ),
                ),
              ),
            ),
          );
        }, itemCount: 2,)
    );
  }
}
