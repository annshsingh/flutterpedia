import 'package:flutter/material.dart';
import 'package:flutterpedia/screens/Articles.dart';
import 'package:flutterpedia/screens/Discussion.dart';
import 'package:flutterpedia/screens/Jobs.dart';
import 'package:flutterpedia/screens/Profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final GlobalKey<ScaffoldState> _scaffoldKey =
      GlobalKey<ScaffoldState>();

  int _currentIndex = 0;

  Color _activeColor = Colors.blue;
  Color _inActiveColor = Colors.black26;


  //List of all the tabs on Home Screen
  final List<Widget> _tabs = [Articles(), Jobs(), Discussion(), Profile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: _tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed('/post'),
        child: Icon(Icons.add),
        foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        elevation: 2.0,
        mini: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _currentIndex == 0 ? _activeColor : _inActiveColor),
            title: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                'Home',
                style: TextStyle(color: _currentIndex == 0 ? _activeColor : _inActiveColor, fontSize: 10, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.business_center, color: _currentIndex == 1 ? _activeColor : _inActiveColor),
            title: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('Jobs',
                  style: TextStyle(color: _currentIndex == 1 ? _activeColor : _inActiveColor, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.people, color: _currentIndex == 2 ? _activeColor : _inActiveColor),
            title: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('Discussion',
                  style: TextStyle(color: _currentIndex == 2 ? _activeColor : _inActiveColor, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: _currentIndex == 3 ? _activeColor : _inActiveColor),
            title: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text('Profile',
                  style: TextStyle(color: _currentIndex == 3 ? _activeColor : _inActiveColor, fontSize: 10, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
