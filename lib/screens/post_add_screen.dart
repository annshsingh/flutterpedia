import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterpedia/modals/post.dart';
import 'package:flutterpedia/modals/user.dart';
import 'package:flutterpedia/utils/networking.dart';
import 'package:flutterpedia/widgets/custom_text_input.dart';
import 'package:flutterpedia/widgets/dropdown_widget.dart';
import 'package:flutterpedia/widgets/tags_input_widget.dart';

class PostScreen extends StatefulWidget {
  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String link = '', type = 'article';
  List<String> tags = [];

  @override
  void initState() {
    super.initState();
  }

  bool isLinkAdded = false;
  bool isOneTagAdded = false;

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
                style: TextStyle(fontSize: 22.0, color: Colors.black),
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
                CustomTextInput(
                  label: "Add link for your post",
                  onSubmitted: (val) => setState(() {
                        if (val.isNotEmpty) {
                          link = val;
                          isLinkAdded = true;
                        } else {
                          isLinkAdded = false;
                        }
                      }),
                ),
                TagsInputWidget(
                  onSubmitted: (tags) {
                    setState(() {
                      if (tags.isNotEmpty) {
                        this.tags = tags;
                        isOneTagAdded = true;
                      } else {
                        isOneTagAdded = false;
                      }
                    });
                  },
                ),
                TypeSelectionWidget(
                  onSubmitted: (val) {
                    setState(() {
                      this.type = val;
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
          color: isLinkAdded && isOneTagAdded
              ? Theme.of(context).primaryColor
              : Colors.grey,
          child: GestureDetector(
            child: Container(
              height: 54,
              child: Center(
                child: Text(
                  "Create Post",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            onTap: () {
              if (isLinkAdded && isOneTagAdded) {
                Networking.addPost(
                  Post(
                    tags: tags,
                    link: link,
                    title: '',
                    description: '',
                    image: '',
                    type: type,
                    user: User.getUser(),
                  ),
                );
              } else {
                final snackBar =
                    SnackBar(content: Text("Please fill all the fields"));
                Scaffold.of(context).showSnackBar(snackBar);
              }
            },
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
