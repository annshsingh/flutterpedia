import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:flutterpedia/utils/networking.dart';
import 'package:flutterpedia/widgets/custom_text_input.dart';
import 'package:flutterpedia/widgets/dropdown_widget.dart';
import 'package:flutterpedia/widgets/rounded_button.dart';
import 'package:flutterpedia/widgets/tags_input_widget.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String link='',type='article';
  List<String>tags=[];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              elevation: 0.0,
              leading: Container(),
              brightness: Brightness.light,
              title: Text(
                "Post",
                style: TextStyle(fontSize: 22.0,color: Colors.black),
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.clear),
                  iconSize: 28.0,
                  onPressed: () {
                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }
                  },
                  color: Colors.black45,
                )
              ],
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              children: <Widget>[
//                CustomTextInput(
//                  label: "Add an interesting title",
//                ),
//                CustomTextInput(
//                  label: "Give your post some description",
//                ),
                CustomTextInput(
                  label: "Add link for your post",
                  onSubmitted: (val)=>setState((){
                    link=val;
                  }),
                ),
                TagsInputWidget(
                  onSubmitted: (tags){
                    setState(() {
                      this.tags=tags;
                    });
                  },
                ),
                TypeSelectionWidget(
                  onSubmitted: (val){
                    setState(() {
                      this.type=val;
                    });
                  },
                )
              ]
                  .map((item) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: item,
                      ))
                  .toList(),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).primaryColor,
          child: RoundedButton(
            "Create Post",
            onTap: () {
              Networking.addPost(Post(
                tags: tags,
                link:link,
                title: '',
                description: '',
                image: '',
                type: type,
                user:User.getUser()
              ));
            },
            shadow: false,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
