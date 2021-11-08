import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carbuddy/screens/Home/Home.dart';
import 'package:carbuddy/screens/Login/login.dart';
import 'package:carbuddy/screens/RideHistory/RideHistory.dart';
import 'package:carbuddy/screens/VehicleRegister/vehicleregister.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: SplashScreen()
      home: AnimatedSplashScreen(splash: Image.asset('assets/images/carbuddy.png'),duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blueGrey,
      nextScreen: HomePage()),
    );
  }
}


