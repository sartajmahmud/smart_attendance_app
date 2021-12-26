import '../Models/Notification.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatefulWidget {
  var notification;
  NotificationCardWidget(this.notification);

  @override
  _NotificationCardWidgetState createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: (){
          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NotificationDetailsScreen()));
          Navigator.pushNamed(context, '/notificationDetailsScreen');
        },
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width*.9,
          decoration: BoxDecoration(
            //color: Colors.green,
            border: Border.all(
              width: 5,
              color: Color(0xffE2E2E2),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Center(child: Text(widget.notification.message,
                style: TextStyle(
                  fontSize: 20,
                ),
                  overflow: TextOverflow.ellipsis,
                )
                )
              ),
              Expanded(
                flex: 1,
                child: Icon(Icons.notifications, size: 45,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
