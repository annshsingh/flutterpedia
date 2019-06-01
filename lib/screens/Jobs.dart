import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:flutterpedia/utils.dart';
import 'package:flutterpedia/widgets/job_card.dart';

class Jobs extends StatefulWidget {
  @override
  _JobsState createState() => _JobsState();
}

class _JobsState extends State<Jobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Jobs',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
              fontFamily: Utils.ubuntuRegularFont),
        ),
      ),
      body: Center(
        child:JobCard(post: Post(
            description: "I faced this issue when I used latest firebase package in my Flutter App. I spent about 10 days trying to solve this problem. Luckily I found the solution for migrating my “Flutter App” to “AndroidX”…",
            image: "https://cdn-images-1.medium.com/max/1200/1*FRkiK7sME-78WXRYiEOnqQ.png",
            link: "https://medium.com/@swhussain110/how-to-migrate-your-flutter-app-to-androidx-9a78eaaa924b",
            tags: [
              "Development",
              "Issue"
            ],
            title: "How to migrate your Flutter App to AndroidX – Syed Wajahat Hussain – Medium",
            type: "article",
            user: User(
                id: "singhbhavneet",
                name: "Bhavneet",
                profilePic: "https://www.shareicon.net/download/2015/09/18/103160_man_512x512.png"
            )
        ),)
      ),
    );
  }
}
