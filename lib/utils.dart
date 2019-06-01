import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Utils {

  /*
   * Method to handle launching of URL
   */
  static launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  //strings
  static const String appName = "Flutterpedia";

  //fonts
  static const String ubuntuFont = "Ubuntu";
  static const String crimsonFont = "Crimson";
  static const String ubuntuRegularFont = "Ubuntu-Regular.ttf";
  static const String crimsonRegularFont = "CrimsonText-Regular.ttf";

}