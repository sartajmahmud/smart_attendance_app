import 'package:flutter/material.dart';

class OrderRequestScreen extends StatefulWidget {
  @override
  _OrderRequestScreenState createState() => _OrderRequestScreenState();
}

class _OrderRequestScreenState extends State<OrderRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(child: Text("New Order")),
      // ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
                "assets/img/splash.jpg",

            )
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Center(
                  child: Text(
                      "New Order",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white
                    ),
                  )
              ),
            ),
            Expanded(
              flex: 3,
                child: SizedBox()
            ),

            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    color: Colors.green,
                      onPressed: (){
                        ///add api code
                      Navigator.pushReplacementNamed(context, '/Pages', arguments: 1);
                      },
                      child: Text("Accept")
                  ),
                  FlatButton(
                      color: Colors.red,
                      onPressed: (){
                        ///add api code
                        Navigator.pushReplacementNamed(context, '/Pages', arguments: 1);
                      },
                      child: Text("Decline")
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
