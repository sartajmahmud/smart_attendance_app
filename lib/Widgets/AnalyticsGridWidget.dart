
import 'package:flutter/material.dart';

class AnalyticsGridWidget extends StatefulWidget {
  String title, value;
  AnalyticsGridWidget(this.title,this.value);

  @override
  _AnalyticsGridWidgetState createState() => _AnalyticsGridWidgetState();
}

class _AnalyticsGridWidgetState extends State<AnalyticsGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height*.18,
        width: MediaQuery.of(context).size.width*.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: [
            BoxShadow(color: Theme.of(context).focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, 2)),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.value,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
              Text(
                widget.title,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
