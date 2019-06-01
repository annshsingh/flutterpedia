import 'package:flutter/material.dart';
import 'package:flutterpedia/screens/HomePage.dart';
import 'package:flutterpedia/screens/selection_screen.dart';
import 'package:flutterpedia/screens/splash_screen.dart';
import 'package:flutterpedia/utils.dart';

class MyApp extends StatelessWidget {
  final materialApp = MaterialApp(
    title: Utils.appName,
    theme: ThemeData(
        primaryColor: Colors.blue,
        fontFamily: Utils.ubuntuFont,
        accentColor: Colors.white,
        canvasColor: Colors.white),
    debugShowCheckedModeBanner: false,
    showPerformanceOverlay: false,
    home: HomePage(),
    //all the app routes are listed here
    routes: <String, WidgetBuilder>{
      '/splash':(context)=>SplashScreen(),
      '/selection':(context)=>SelectionScreen()
    },
  );

  @override
  Widget build(BuildContext context) {
    return materialApp;
  }
}
