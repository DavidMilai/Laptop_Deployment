import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            InputText(
              hint: 'Full names',
              textObscure: false,
            ),
            SizedBox(height: 20),
            InputText(
              hint: 'Student Number',
              textObscure: false,
            ),
            SizedBox(height: 20),
            InputText(
              hint: 'Searial number',
              textObscure: false,
            ),
            SizedBox(height: 20),
            MaterialButton(
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              highlightElevation: 30,
              padding: EdgeInsets.all(15),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
