import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import '../Controllers/NotificationController.dart';
import '../Widgets/NotificationCardWidget.dart';
import 'app_text.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen();

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends StateMVC<NotificationsScreen> {

  NotificationController _con;
  _NotificationsScreenState() : super(NotificationController()) {
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
            text: "Notifications",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body:ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return NotificationCardWidget(_con.notifications[index]);
        }, itemCount: _con.notifications.length,)
      // Container(
      //   child: Column(
      //     children: [
      //       NotificationCardWidget(),
      //     ],
      //   ),
      // ),
    );
  }
}
