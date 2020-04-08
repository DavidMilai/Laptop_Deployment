import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchDetails extends StatefulWidget {
  @override
  _SearchDetailsState createState() => _SearchDetailsState();
}

class _SearchDetailsState extends State<SearchDetails> {
  final _fireStore = Firestore.instance;
  String studentName;
  String studentNumber;
  String serialNumber;

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
              hint: 'Student name',
              textObscure: false,
              onChange: (value) {
                studentName = value;
              },
            ),
            SizedBox(height: 10),
            InputText(
              hint: 'Student Number',
              textObscure: false,
              onChange: (value) {
                studentNumber = value;
              },
            ),
            SizedBox(height: 10),
            InputText(
              hint: 'Searial number',
              textObscure: false,
              onChange: (value) {
                serialNumber = value;
              },
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            MaterialButton(
              child: Text(
                'Search',
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              highlightElevation: 30,
              padding: EdgeInsets.all(15),
              onPressed: () {
//  String studentName;
//  String studentNumber;
//  String serialNumber;
//              if(studentNumber == null && serialNumber == null){
//                print('object');
//              }else if(studentNumber == null && serialNumber == null)
//                print('object');
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
