import 'package:flutter/material.dart';
import 'package:flutterpedia/utils.dart';

class Discussion extends StatefulWidget {
  @override
  _DiscussionState createState() => _DiscussionState();
}

class _DiscussionState extends State<Discussion> {
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
              'Discussion',
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
