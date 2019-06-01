import 'package:flutter/material.dart';
import 'package:flutterpedia/screens/HomePage.dart';
import 'package:flutterpedia/screens/onboarding_screen.dart';
import 'package:flutterpedia/screens/post_add_screen.dart';
import 'package:flutterpedia/screens/selection_screen.dart';
import 'package:flutterpedia/screens/signup_screen.dart';
import 'package:flutterpedia/screens/splash_screen.dart';
import 'package:flutterpedia/screens/welcome_screen.dart';
import 'package:flutterpedia/utils.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: Utils.appName,
    theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: Utils.ubuntuFont,),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: SplashScreen(),
    //all the app routes are listed here
    routes: <String, WidgetBuilder>{
      '/home':(context)=>HomePage(),
      '/splash':(context)=>SplashScreen(),
      '/selection':(context)=>SelectionScreen(),
      '/signUp':(context)=>SignUpScreen(),
      '/onBoarding':(context)=>OnBoardingScreen(),
      '/post':(context)=>PostScreen()
    },
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
