import 'package:flutter/material.dart';
import 'package:school/widgets/rounded_button.dart';

class SelectionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  var items=[];
  int selected=-1;

  @override
  void initState() {
    super.initState();
    items.add({
      "title": "Parent",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "images/parent.png"
    });
    items.add({
      "title": "School",
      "subtitle": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
      "image": "images/school.png"
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        iconTheme:
            IconThemeData(color: Theme.of(context).textTheme.title.color),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Choose Your Theme",
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Text(
                "Pick a theme that works for you. You can always change themes in your app settings.",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[buildCard(items[0], 0), buildCard(items[1], 1)],
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding:  EdgeInsets.only(bottom: 12.0),
        child: RoundedButton("Continue", onTap: selected==-1?null:(){
          if(selected==1){
            Navigator.of(context).pushNamed("/schoolSignin");
          }
          else if(selected==0){
            Navigator.of(context).pushNamed("/parentSignin");
          }
        },nextIcon: true,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
  Widget buildCard(var item, int index) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected = index;
            });
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.pinkAccent.withOpacity(0.05),
                          blurRadius: 8.0,
                          spreadRadius: 0.2,
                          offset: Offset(0.2, 1.0))
                    ],
                    borderRadius: BorderRadius.circular(16.0)),
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Image.asset(item["image"],),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Text(
                        item["title"], style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0),),
                    ),
                  ],
                ),
              ),
              index == selected ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.check_circle, color: Colors.green, size: 28.0,),
              ) : Container(width: 0.00, height: 0.0,),
            ],
          ),
        ),
      ),
    );
  }

}
