import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleWidget extends StatefulWidget {
  final Post post;
  final int type=0;
  const ArticleWidget({Key key,@required this.post}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _ArticleWidgetState();

}

class _ArticleWidgetState extends State<ArticleWidget> {
  @override
  Widget build(BuildContext context) {
    return buildCover();
  }
  Widget buildCover(){
    Post post=widget.post;
    return InkWell(
      onTap: (){
        _launchURL(post.link);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
        child: Row(
          children: <Widget>[
            Expanded(child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 6.0, 12.0),
                  child: Text(post.title,style: TextStyle(fontSize: 18.0,color: Colors.black,fontWeight: FontWeight.w700,height: 1.2),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: post.tags.take(2).map((tag)=>
                    Container(
                      margin: EdgeInsets.only(right: 12.0),
                      padding:EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Text(tag,style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w500,fontSize: 14.0),),
                    )).toList()
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.only(right:4.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(post.image??'',width: 96.0,height: 96.0,fit: BoxFit.cover,),
              ),
            )
          ],
        ),
      ),
    );
  }
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}