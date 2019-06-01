import 'package:flutter/material.dart';
import 'package:flutterpedia/utils.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          child: Center(
            child: Text(
              'Home',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontFamily: Utils.ubuntuRegularFont),
            ),
          ),
        ),
      ),
    );
  }
}
