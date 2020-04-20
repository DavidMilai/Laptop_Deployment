import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';

class EditScreen extends StatefulWidget {
  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Edit Issued Laptop'),
      ),
      body: Material(
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                InputText(textObscure: false, hint: 'Serial number'),
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
                  onPressed: () {},
                  color: Colors.red,
                ),
              ],
            ),
          )),
    );
  }
}
