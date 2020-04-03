import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  CustomIconButton(
      {@required this.textTitle,
      @required this.iconType,
      @required this.onpress});
  final String textTitle;
  final IconData iconType;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.red,
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Icon(
            iconType,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(textTitle)
        ],
      ),
      onPressed: onpress,
    );
  }
}
