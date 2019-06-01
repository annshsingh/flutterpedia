import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:flutterpedia/screens/profile_screen.dart';
import 'package:flutterpedia/utils.dart';
import 'package:flutterpedia/utils/networking.dart';
import 'package:flutterpedia/widgets/article_widget.dart';

class Articles extends StatefulWidget {
  @override
  _ArticlesState createState() => _ArticlesState();
}

class _ArticlesState extends State<Articles> {
  List<Post>articles=[];
  @override
  void initState() {
    super.initState();
    refresh();
  }
  Future<Null> refresh(){
    setState(() {
      articles.clear();
    });
    return Networking.getPosts('article').then((val){
      setState(() {
        this.articles=val;
      });
      key.currentState.show(atTop: false);
    });
  }
  final GlobalKey<RefreshIndicatorState>key=GlobalKey<RefreshIndicatorState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
          child: FlutterLogo(size: 18.0,),
        ),
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
      body: RefreshIndicator(

        onRefresh: refresh,
        key: key,
        child: articles.length==0?Center(
          child: CircularProgressIndicator(),
        ):ListView.separated(separatorBuilder: (context,index)=>Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(),
        ),itemBuilder: (context,index)=>ArticleWidget(post: articles[index],),itemCount: articles.length,),
      ),
    );
  }

}
