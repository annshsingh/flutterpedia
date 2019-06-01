import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData iconData;
  final bool obsecure;
  final Function onSubmitted;

  const CustomTextField(
      {Key key,
      @required this.label,
      this.obsecure = false,
      @required this.onSubmitted,
      @required this.iconData})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 5.2 / 6,
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(12.0),
        shape: BoxShape.rectangle,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              obscureText: widget.obsecure?!isShowing:false,
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  icon: Icon(widget.iconData),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintStyle: TextStyle(fontWeight: FontWeight.w300),
                  labelText: widget.label),
              maxLines: 1,
              onChanged: widget.onSubmitted,
              onSubmitted: widget.onSubmitted,
            ),
          ),
          widget.obsecure
              ? FlatButton(
                  child: Text(
                    !isShowing ? "Show" : "Hide",
                    style: TextStyle(fontSize: 18.0, color: Colors.purple),
                  ),
                  onPressed: () {
                    setState(() {
                      isShowing = !isShowing;
                    });
                  },
                )
              : Container(
                  width: 0.0,
                  height: 0.0,
                )
        ],
      ),
    );
  }
}
