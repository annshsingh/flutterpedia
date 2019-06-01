import 'package:flutter/material.dart';
import 'package:flutterpedia/widgets/rounded_button.dart';
import 'package:page_indicator/page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _OnBoardingScreenState();

}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var items = [];
  int selected = -1;
  PageController controller=PageController();
  @override
  void initState() {
    super.initState();
    items.add({
      "title": "Save Your Time",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "images/welcome.png"
    });
    items.add({
      "title": "Monitor Activities",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "images/welcome.png"
    });
    items.add({
      "title": "Monitor Activities",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "images/welcome.png"
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton(onPressed: (){}, child: Text("Skip",style: TextStyle(fontSize: 18.0,color:Colors.purple),))
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: PageIndicatorContainer(
                        pageView: PageView.builder(itemBuilder: (context, index) {
                          return Center(child: buildCard(items[index], index),);
                        },
                          physics: BouncingScrollPhysics(),
                          pageSnapping: true,
                          onPageChanged: (index) {},
                          scrollDirection: Axis.horizontal,
                          itemCount: items.length,
                        ), length: items.length,indicatorColor: Color(0xffeeeeee),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: RoundedButton(
              "Get Started",
              nextIcon: true,
              onTap: () {
                Navigator.of(context).pushNamed('/home');
              },
            ),
          ),

        ],
      ),
    );
  }

  Widget buildCard(var item, int index) {
    return Container(
      decoration: BoxDecoration(color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.pinkAccent.withOpacity(0.2),
                blurRadius: 24.0,
                spreadRadius: 0.2,
                offset: Offset(0.2, 1.0))
          ],
          borderRadius: BorderRadius.circular(12.0)),
      width: MediaQuery
          .of(context)
          .size
          .width * 3 / 4,
      padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(item["image"], width: MediaQuery
              .of(context)
              .size
              .width / 2, height: MediaQuery
              .of(context)
              .size
              .width / 2,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              item["title"], style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.0),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              item["subtitle"],
              style: TextStyle(color: Colors.black38, fontSize: 18.0),
              maxLines: 3,
              textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }

}