import 'package:flutter/material.dart';
import 'package:flutterpedia/utils.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                'Profile',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.all(12),
                    child: Stack(
                      children: <Widget>[
                        ClipRRect(
                          child: Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.black,
                                    offset: new Offset(0.0, 10.0),
                                    blurRadius: 20.0,
                                  )
                                ],
                                image: DecorationImage(
                                    image: AssetImage("assets/images/dp.png"),
                                    fit: BoxFit.cover)),
                          ),
                          borderRadius: BorderRadius.circular(100),
                          clipBehavior: Clip.antiAlias,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
