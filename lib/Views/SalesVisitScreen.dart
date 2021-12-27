import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Controllers/VisitController.dart';
import 'app_text.dart';

class SalesVisitScreen extends StatefulWidget {
  const SalesVisitScreen();

  @override
  _SalesVisitScreenState createState() => _SalesVisitScreenState();
}

class _SalesVisitScreenState extends StateMVC<SalesVisitScreen> {
  VisitController _con;
  _SalesVisitScreenState() : super(VisitController()) {
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
            text: "Your Sales Visits",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            textColor: Colors.black,
            onPressed: () {
              Navigator.pushNamed(context, '/addNewSalesVisit');
            },
            child: Text("Add New"),
            shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: _con.salesVisits.length,
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
                                text: 'Sales Visit No: ${_con.salesVisits[index].id}',
                                fontWeight: FontWeight.w300,
                                fontSize: 15,
                              ),
                              AppText(
                                text: _con.salesVisits[index].seller.name,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 // Text('Visit Date: ${(_con.salesVisits[index].}'),
                                  Text('Visit Date: 29/09/21'),
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
