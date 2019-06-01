import 'package:flutter/material.dart';
import 'custom_input_label.dart';

class TypeSelectionWidget extends StatefulWidget {
  final Function(String) onSubmitted;

  const TypeSelectionWidget({Key key, this.onSubmitted}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TypeSelectionWidgetState();
}

class _TypeSelectionWidgetState extends State<TypeSelectionWidget> {
  String val = "Article";
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        CustomInputLabel(
          label: "Select type of your post",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: DropdownButton(
            value: val,
            items: [
              DropdownMenuItem(
                child: Text("Article"),
                value: "Article",
              ),
              DropdownMenuItem(
                child: Text("Job"),
                value: "Job",
              ),
              DropdownMenuItem(
                child: Text("Discussion"),
                value: "other",
              ),
            ],
            onChanged: (val) {
              setState(() {
                this.val = val;
                widget.onSubmitted(val.toLowerCase());
              });
            },
          ),
        )
      ],
    );
  }

  Widget buildInputWidget() {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: TextFormField(
        decoration: InputDecoration(border: OutlineInputBorder(), hintText: "75"),
      ),
    );
  }
}
