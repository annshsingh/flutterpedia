import 'package:flutter/material.dart';
import 'package:flutterpedia/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("images/welcome.png",width: MediaQuery.of(context).size.width*3/4,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Text("Welcome",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24.0),),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*2/3,
                    padding: const EdgeInsets.only(top:16.0),
                    child: Text('Lorem ipsum dolor sit amet,consectetur adisppicin',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold,fontSize: 18.0),textAlign: TextAlign.center,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:32.0),
                    child: RoundedButton(
                      "Get Started",
                      onTap: (){
                        Navigator.of(context).pushNamed('/selection');
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text("Terms and Conditions Apply",style: TextStyle(color: Colors.black54,fontSize: 16.0,decoration: TextDecoration.underline),),
          )
        ],
      ),
    );
  }

}