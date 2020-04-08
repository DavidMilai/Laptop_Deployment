import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _firestore = Firestore.instance;
  String studentName;
  String studentNumber;
  String serialNumber;
  String faculty;

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
              onChange: (value) {
                studentName = value;
              },
            ),
            SizedBox(height: 20),
            InputText(
              hint: 'Student Number',
              textObscure: false,
              onChange: (value) {
                studentNumber = value;
              },
            ),
            SizedBox(height: 20),
            InputText(
              hint: 'Searial number',
              textObscure: false,
              onChange: (value) {
                serialNumber = value;
              },
            ),
            InputText(
              hint: 'Faculty',
              textObscure: false,
              onChange: (value) {
                faculty = value;
              },
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
                _firestore.collection('laptop list').add({
                  'faculty': faculty,
                  'serialNumber': serialNumber,
                  'studentName': studentName,
                  'studentNumber': serialNumber
                });
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
