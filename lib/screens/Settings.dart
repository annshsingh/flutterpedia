import 'package:flutter/material.dart';
import 'package:flutterpedia/utils.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  bool isSwitched1 = true;
  bool isSwitched2 = true;
  bool isSwitched3 = true;
  bool isSwitched4 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Settings',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
//                Container(
//                  width: 150,
//                  height: 150,
//                  margin: EdgeInsets.all(12),
//                  child: Stack(
//                    alignment: Alignment.bottomRight,
//                    children: <Widget>[
//                      ClipRRect(
//                        child: Container(
//                          decoration: BoxDecoration(
//                              boxShadow: [
//                                new BoxShadow(
//                                  color: Colors.black,
//                                  offset: new Offset(0.0, 10.0),
//                                  blurRadius: 20.0,
//                                )
//                              ],
//                              image: DecorationImage(
//                                  image: AssetImage("assets/images/dp.png"),
//                                  fit: BoxFit.cover)),
//                        ),
//                        borderRadius: BorderRadius.circular(100),
//                        clipBehavior: Clip.antiAlias,
//                      ),
//                      Container(
//                        margin: EdgeInsets.only(right: 8, bottom: 8),
//                        width: 32,
//                        height: 32,
//                        child: ClipRRect(
//                          child: Container(
//                            color: Colors.blue,
//                            child: Icon(
//                              Icons.camera_alt,
//                              color: Colors.white,
//                              size: 20,
//                            ),
//                          ),
//                          borderRadius: BorderRadius.circular(100),
//                          clipBehavior: Clip.antiAlias,
//                        ),
//                      ),
//                    ],
//                  ),
//                ),
//                Center(
//                  child: Container(
//                    margin: EdgeInsets.only(top: 12),
//                    child: Text(
//                      'Annsh Singh',
//                      style: TextStyle(
//                          fontSize: 32.0,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.black87,
//                          fontFamily: Utils.ubuntuRegularFont),
//                    ),
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 24.0),
//                  child: Row(
//                    mainAxisSize: MainAxisSize.max,
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      IconButton(
//                        icon: Image.asset('assets/images/github.png'),
//                        onPressed: null,
//                        iconSize: 44,
//                      ),
//                      Container(
//                        height: 44,
//                        width: 2,
//                        color: Colors.black12,
//                      ),
//                      IconButton(
//                        icon: Image.asset('assets/images/linkedin.png'),
//                        onPressed: null,
//                        iconSize: 44,
//                      ),
//                      Container(
//                        height: 44,
//                        width: 2,
//                        color: Colors.black12,
//                      ),
//                      IconButton(
//                        icon: Image.asset('assets/images/twitter.png'),
//                        onPressed: null,
//                        iconSize: 44,
//                      )
//                    ],
//                  ),
//                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: ListView(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    children: <Widget>[
                      listItem("All Notifications", isSwitched1, (value) {
                        setState(() {
                           isSwitched1 = value;
                        });
                      }),
                      listItem("Job Alerts", isSwitched2, (value) {
                        setState(() {
                          isSwitched2 = value;
                        });
                      }),
                      listItem("Setting 3", isSwitched3, (value) {
                        setState(() {
                          isSwitched3 = value;
                        });
                      }),
                      listItem("Setting 4", isSwitched4, (value) {
                        setState(() {
                          isSwitched4 = value;
                        });
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listItem(String title, bool state, Function(bool position) fun) => Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                '$title',
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    fontFamily: Utils.ubuntuRegularFont),
              ),
              Switch(
                value: state,
                onChanged: fun,
                activeTrackColor: Colors.lightBlueAccent[100],
                activeColor: Colors.blue,
              )
            ],
          ),
        ),
      );
}
