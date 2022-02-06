import 'dart:io';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FlatButton(
          onPressed: () async {
            try {
              final result = await InternetAddress.lookup('google.com');
              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                print('connected');
                Navigator.pushNamed(context, '/');
              }
            } on SocketException catch (_) {
              print('not connected');

            }
          },
          child: Center(
            child: Text("No Internet"),
          ),
        ),

      ),
    );
  }
}
