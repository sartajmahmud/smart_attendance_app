import 'package:flutter/material.dart';
import 'package:smart_attendance/Repositories/SettingsRepostiory.dart';
import 'package:smart_attendance/Views/splash_screen.dart';

void main() {
  runApp(MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SplashScreen()));
}
