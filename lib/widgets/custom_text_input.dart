import 'package:flutter/material.dart';

import 'custom_input_label.dart';

class CustomTextInput extends StatefulWidget {
  final String label;
  final Function(String) onSubmitted;
  const CustomTextInput({Key key, this.label,@required this.onSubmitted}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomInputLabel(
          label: widget.label,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14.0),
          child: TextFormField(
            autocorrect: true,
            autovalidate: true,
            maxLength: 100,
            onFieldSubmitted: widget.onSubmitted,
            enableInteractiveSelection: true,
            textCapitalization: TextCapitalization.sentences,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
                fontSize: 20.0),
            decoration: InputDecoration(
                counterStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.black,
                    fontSize: 16.0),
                border: OutlineInputBorder(),
                hasFloatingPlaceholder: false,
                hintText: "Write here",
                hintStyle: TextStyle(
                    fontWeight: FontWeight.w200,
                    color: Colors.black26,
                    fontSize: 18.0)),
          ),
        )
      ],
    );
  }
}
