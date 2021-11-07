import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:carbuddy/screens/splashScreen/Home.dart';
import 'package:carbuddy/screens/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      // home: SplashScreen()
      home: AnimatedSplashScreen(splash: Image.asset('assets/images/carbuddy.png'),duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.blue,
      nextScreen: HomePage()),
    );
  }
}


