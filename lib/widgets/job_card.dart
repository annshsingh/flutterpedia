import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:url_launcher/url_launcher.dart';

class JobCard extends StatefulWidget {
  final Post post;

  const JobCard({Key key, this.post}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  @override
  Widget build(BuildContext context) {
    Post post = widget.post;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                post.image??'',
                width: 105.0,
                height: 105.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 0.0, 4.0),
                child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
                Text(
                  post.title,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      height: 1.2),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("By ${post.user.name}",style: TextStyle(color: Colors.black45),),),
                Padding(
                  padding: const EdgeInsets.only(top:4.0),
                  child: RaisedButton(

                    onPressed: () {_launchURL(post.link);},
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    elevation: 0.0,
                    child: Text(
                      "Apply",
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                    color: Colors.purple,
                  ),
                )
            ],
          ),
              )),
        ],
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
