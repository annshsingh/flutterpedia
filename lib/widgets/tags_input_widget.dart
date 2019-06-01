import 'package:flutter/material.dart';

import 'custom_input_label.dart';

class TagsInputWidget extends StatefulWidget {
  final Function(List<String>) onSubmitted;

  const TagsInputWidget({Key key,@required this.onSubmitted}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TagsInputWidgetState();
}

class _TagsInputWidgetState extends State<TagsInputWidget> {
  TextEditingController controller;
  List<String> tags = [];
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomInputLabel(
          label: "Add some tags for your item.",
        ),
        Wrap(
          children: tags.map((tag) => createTag(tag)).toList(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: TextFormField(
            autocorrect: true,
            autovalidate: true,
            maxLength: 100,
            onFieldSubmitted: (val) {
              controller.text="";
              setState(() {
                tags.add(val);
                widget.onSubmitted(tags);
              });
            },
            enableInteractiveSelection: true,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 20.0),
            controller: controller,
            decoration: InputDecoration(
                counterStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                    fontSize: 16.0),
                border: UnderlineInputBorder(),
                hasFloatingPlaceholder: false,
                hintText: "Write here",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                    fontSize: 18.0)),
          ),
        )
      ],
    );
  }

  Widget createTag(String tag) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(25.0)),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      margin: EdgeInsets.fromLTRB(0.0, 8.0, 10.0, 0.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            tag,
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: InkWell(
              child: Icon(
                Icons.cancel,
                color: Colors.white,
                size: 24.0,
              ),
              onTap: () {
                setState(() {
                  tags.remove(tag);
                  widget.onSubmitted(tags);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
