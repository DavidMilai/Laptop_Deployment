import 'package:flutter/cupertino.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconType,
              color: Colors.white,
              size: 50,
            ),
            SizedBox(height: 20),
            Text(
              textTitle,
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
        onPressed: onpress,
      ),
    );
  }
}
