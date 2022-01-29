import 'package:flutter/material.dart';
import 'package:smart_attendance/Widgets/AnalyticsGridWidget.dart';

import 'app_text.dart';

class AnalyticsScreen extends StatefulWidget {
  AnalyticsScreen();

  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
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
            text: "Dashboard",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Clients',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("Total", "15"),
                    AnalyticsGridWidget("Existing", "5"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("New", "8"),
                    AnalyticsGridWidget("Blocked", "2"),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Sales',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("Monthly Sales Target", "100000"),
                    AnalyticsGridWidget("Monthly Sales Achieved", "10500"),

                  ],
                ),
                AnalyticsGridWidget("Monthly Sales Achieved %", "10.05%"),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Collection',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("Monthly Collection Target", "60000"),
                    AnalyticsGridWidget("Monthly Collection Achieved", "30000"),
                  ],
                ),
                AnalyticsGridWidget("Monthly Collection Achieved %", "50%"),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Credit',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("Total Credit", "807600"),
                    AnalyticsGridWidget("30 Days Credit", "450000"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("45 Days Credit", "200000"),
                    AnalyticsGridWidget("60 Days Credit", "120000"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnalyticsGridWidget("75 Days Credit", "20000"),
                    AnalyticsGridWidget("90 Days Credit", "5000"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
