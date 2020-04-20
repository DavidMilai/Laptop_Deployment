import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barcode_scan/barcode_scan.dart';

class IssueLaptop extends StatefulWidget {
  @override
  _IssueLaptopState createState() => _IssueLaptopState();
}

class _IssueLaptopState extends State<IssueLaptop> {
  final _fireStore = Firestore.instance;
  final _form = GlobalKey<FormState>();
  String studentName;
  String studentNumber;
  String serialNumber;
  String barcode = "";
  String faculty;
  bool checkboxMale = true;
  bool checkboxFemale = false;
  bool validate = false;
  var schools = ['BCOM', 'FIT', 'SLS', 'SHSS'];

  int gender() {
    if (checkboxMale == true) {
      return 1;
    } else
      return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Issue Laptop'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Form(
          key: _form,
          child: ListView(children: <Widget>[
            InputText(
              hint: 'Full names',
              textObscure: false,
              onChange: (value) {
                studentName = value;
              },
              validate: (value) {
                if (value.isEmpty) {
                  return 'Please type in a name';
                } else if (value.length <= 2) {
                  return 'Name cant be two or less characters';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            InputText(
              keyboard: TextInputType.number,
              hint: 'Student Number',
              textObscure: false,
              onChange: (value) {
                studentNumber = value;
              },
              validate: (value) {
                if (value.isEmpty) {
                  return 'Please type in a Student number';
                } else if (value.length <= 4) {
                  return 'Student Number cant be 4 or less characters';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            InputText(
              hint: 'Searial number',
              textObscure: false,
              onChange: (value) {
                serialNumber = value;
              },
              validate: (value) {
                if (value.isEmpty) {
                  return 'Please type in a Serial Number';
                } else if (value.length <= 4) {
                  return 'Serial Number cant be 4 or less characters';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                filled: true,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                fillColor: Colors.blueAccent[200],
              ),
              hint: Text(
                'Faculty',
                style: TextStyle(fontSize: 20, color: Colors.white70),
              ),
              items: schools.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  faculty = value;
                });
              },
              value: faculty,
            ),
            SizedBox(height: 10),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text('Male'),
                      Checkbox(
                          value: checkboxMale,
                          onChanged: (newValue) {
                            setState(() {
                              checkboxMale = true;
                              checkboxFemale = false;
                            });
                          }),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text('Female'),
                      Checkbox(
                          value: checkboxFemale,
                          onChanged: (newValueFemale) {
                            setState(() {
                              checkboxMale = false;
                              checkboxFemale = true;
                            });
                          }),
                    ],
                  ),
                ]),
            SizedBox(height: 20),
            MaterialButton(
              child: Text(
                'Scan Serial Number',
                style: TextStyle(fontSize: 20),
              ),
              textColor: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              highlightElevation: 30,
              padding: EdgeInsets.all(15),
              onPressed: scan,
              color: Colors.red,
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
                if (_form.currentState.validate() == true) {
                  if (faculty == null) {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Selcet faculty"),
                          );
                        });
                  } else {
                    _fireStore.collection('laptop list').add({
                      'faculty': faculty,
                      'serialNumber': serialNumber,
                      'studentName': studentName,
                      'studentNumber': studentNumber,
                      'gender': gender(),
                    });
                    Navigator.pop(context);
                  }
                }
              },
              color: Colors.red,
            ),
          ]),
        ),
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'The user did not grant the camera permission!';
        });
      } else {
        setState(() => this.barcode = 'Unknown error: $e');
      }
    }
  }
}
