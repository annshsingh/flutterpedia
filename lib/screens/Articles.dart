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
        centerTitle: true,
        title: Text(
          'Home',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Utils.ubuntuRegularFont),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, bottom: 8.0, right: 16.0),
              child: CircleAvatar(
                radius: 20.0,
                backgroundImage: AssetImage("assets/images/dp.png"),
              ),
            ),
            onTap: () => showModalBottomSheet(
                  context: context,
                  builder: (context) => ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            header(),
                            Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      IconButton(
                                        icon: Image.asset(
                                            'assets/images/github.png'),
                                        onPressed: null,
                                        iconSize: 24,
                                      ),
                                      Container(
                                        height: 24,
                                        width: 2,
                                        color: Colors.black12,
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                            'assets/images/linkedin.png'),
                                        onPressed: null,
                                        iconSize: 24,
                                      ),
                                      Container(
                                        height: 24,
                                        width: 2,
                                        color: Colors.black12,
                                      ),
                                      IconButton(
                                        icon: Image.asset(
                                            'assets/images/twitter.png'),
                                        onPressed: null,
                                        iconSize: 24,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 24.0, bottom: 24.0),
                              child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.black,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: Icon(
                                          Icons.exit_to_app,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                      Text("Logout"),
                                    ],
                                  ),
                                  onPressed: () {},
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0))),
                            ),
                            Container(
                              height: 1,
                              color: Colors.black12,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 24, top: 24),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black45,
                                        fontFamily: Utils.ubuntuRegularFont),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, right: 12.0),
                                    child: Text(
                                      '•',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                          fontFamily: Utils.ubuntuRegularFont),
                                    ),
                                  ),
                                  Text(
                                    'Terms of Service',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black45,
                                        fontFamily: Utils.ubuntuRegularFont),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
          ),
        ],
      ),
    );
  }

  Widget header() => Ink(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: AssetImage("assets/images/dp.png"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      margin: EdgeInsets.only(left: 12),
                      child: Text(
                        'Annsh Singh',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontFamily: Utils.ubuntuRegularFont),
                      ),
                    ),
                  ),
                ],
              ),
              RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          Icons.share,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      Text("Share"),
                    ],
                  ),
                  onPressed: () {},
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ],
          ),
        ),
      );
}
