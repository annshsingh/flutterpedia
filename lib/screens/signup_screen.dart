import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:flutterpedia/utils/networking.dart';
import 'package:flutterpedia/widgets/custom_text_field.dart';
import 'package:flutterpedia/widgets/rounded_button.dart';


class SignUpScreen extends StatefulWidget {
  final String url;

  const SignUpScreen({Key key, this.url}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String email='', password='';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 48.0, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18.0),
                          child: Text(
                            "Pick a theme that works for you. You can always change themes in your app settings.",
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Image.network(
                      widget.url,
                      width: MediaQuery.of(context).size.width / 3.5,
                    ),
                  ),
                ],
              ),
              getForm(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Terms and Conditions apply",
                style: TextStyle(
                    color: Colors.black38,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.0,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getForm() {
    return Container(
      margin: EdgeInsets.only(top: 48.0),
      child: Form(
          child: Column(
        children: <Widget>[
          CustomTextField(
            label: "Name",
            iconData: Icons.email,
            onSubmitted: (val) {
              setState(() {
                email=val;
              });
            },
          ),
          CustomTextField(
            label: "Github Id",
            iconData: Icons.lock,
            onSubmitted: (val) {
              setState(() {
                password=val;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.0),
            child: RoundedButton(
              "Continue",
              onTap: () {
                if (email.length == 0) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Email can not be empty"),
                    action: SnackBarAction(label: "Ok", onPressed: () {}),
                  ));
                  return;
                } else if (password.length == 0) {
                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                    content: Text("Password can not be empty"),
                    action: SnackBarAction(label: "Ok", onPressed: () {}),
                  ));
                  //networking
                  return;
                }
                showDialogScreen();
                Networking.registerUser(User(id: password,name: email,profilePic: widget.url)).then((val) {
                  print(val);
                  if(val){
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed('/onBoarding');
                  }
                  else{
                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                      content: Text("Some error  occured"),
                      action: SnackBarAction(label: "Ok", onPressed: () {}),
                    ));
                  }
                });
              },
              nextIcon: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Don't have an account on github yet ? ",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0,
                    )),
                InkWell(
                  onTap: (){
                  },
                  child: Text("Click Here",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                          fontSize: 16.0)),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }

  void showDialogScreen() {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Verifying User"),
            content: Container(
              alignment: Alignment.center,
              height: 100.0,
              child: CircularProgressIndicator(

              ),
            ),
          );
        });
  }
}
