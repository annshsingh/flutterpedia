import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:flutterpedia/screens/profile_screen.dart';
import 'package:flutterpedia/utils.dart';
import 'package:flutterpedia/widgets/article_widget.dart';

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
                backgroundImage: NetworkImage(User
                    .getUser()
                    .profilePic),
              ),
            ),
            onTap: () =>
                showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                    ProfileScreen()
                ),
          ),
        ],
      ),
      body: Center(
        child: ArticleWidget(
          post: Post(
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
          ),
        ),
      ),
    );
  }

}
