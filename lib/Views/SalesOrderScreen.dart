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
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Material(
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      18,
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/salesOrderDetails');
                      },
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * .8,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE2E2E2),
                          ),

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppText(
                                text: 'Sales Order No: 1234',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              AppText(
                                text: 'ABC Company',
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Delivery Date: 29/09/21'),
                                  Text('Order Date: 23/09/21')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
