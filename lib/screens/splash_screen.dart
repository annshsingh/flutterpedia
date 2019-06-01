import 'package:flutter/material.dart';
import 'package:school/widgets/app_logo.dart';
import 'package:school/widgets/rounded_button.dart';
import 'package:school/utils/networking.dart' as network;

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Column(mainAxisSize: MainAxisSize.min, children: [
            Expanded(
                child: Center(
              child: AppLogo(),
            )),
          ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RoundedButton(
                  "Lets Go",
                  onTap: () {Navigator.of(context).pushNamed('/selection');},
                ),
                Padding(
                  padding: const EdgeInsets.only(top:16.0),
                  child: Text("Terms and Conditions apply",style: TextStyle(color: Colors.black38,fontWeight: FontWeight.w600,fontSize: 16.0,decoration: TextDecoration.underline),),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
