import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscussionCard extends StatefulWidget {
  final Post post;

  const DiscussionCard({Key key, this.post}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _DiscussionCardState();

}

class _DiscussionCardState extends State<DiscussionCard> {
  @override
  Widget build(BuildContext context) {
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
                  child:Wrap(
                      children: post.tags.map((tag)=>
                          Container(
                            margin: EdgeInsets.only(right: 12.0),
                            padding:EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(12.0)
                            ),
                            child: Text(tag,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500,fontSize: 14.0),),
                          )).toList()
                  ),
                )
              ],
            )),
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