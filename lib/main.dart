import 'package:flutter/material.dart';
import 'package:smart_attendance/Views/DashboardScreen.dart';
import 'Repositories/SettingsRepostiory.dart';
import 'Views/ForgetPasswordScreen.dart';
import 'Views/SignUpScreen.dart';
import 'Views/login_screen.dart';
import 'Views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configurations");
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) => SignUpScreen(),
          '/forgetPass': (context) => ForgetPasswordScreen(),
          '/dashboard': (context) => DashboardScreen()
        },
  )
  );
}
