import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final String boxName;
  Function tickBox;
  CheckBox({@required this.boxName});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(value: true, onChanged: tickBox),
        Text(boxName),
      ],
    );
  }
}
