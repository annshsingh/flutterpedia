import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  final String tag;
  const TagWidget({Key key,@required this.tag}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
          color: Colors.orangeAccent, borderRadius: BorderRadius.circular(8.0)),
      padding: EdgeInsets.all(8.0),
      child: Text( 
        tag,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
      ),
    );
  }
}
