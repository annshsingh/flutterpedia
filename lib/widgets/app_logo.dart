import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RichText(
            text: TextSpan(children: [
              TextSpan(text: "s", style: TextStyle(color: Colors.purple)),
              TextSpan(text: "p", style: TextStyle(color: Colors.purple)),
              TextSpan(text: "ring", style: TextStyle(color: Colors.orange))
            ], style: TextStyle(fontSize: 80.0, fontWeight: FontWeight.w800)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
            child: Text("School Parent Ring.",
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600)),
          )
        ],
      ),
    );
  }
}
