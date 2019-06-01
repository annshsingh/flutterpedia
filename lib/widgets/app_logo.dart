import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: FlutterLogo(
              size: 96.0,
            ),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(text: "Flutter", style: TextStyle(color: Colors.blue)),
              TextSpan(text: "Pedia", style: TextStyle(color: Colors.black))
            ], style: TextStyle(fontSize: 42.0, fontWeight: FontWeight.w700)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
            child: Text("One Place solution for developers",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
