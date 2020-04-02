import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:flutterapp/screens/home_screen.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Laptop Deployment'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        color: Colors.blueAccent,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Flexible(child: Image(image: AssetImage('assets/SU.png'))),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  InputText(
                    hint: 'Email',
                    textObscure: false,
                  ),
                  SizedBox(height: 10),
                  InputText(
                    hint: 'Password',
                    textObscure: true,
                  ),
                  SizedBox(height: 10),
                  MaterialButton(
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    ),
                    textColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    elevation: 5,
                    highlightElevation: 30,
                    padding: EdgeInsets.all(15),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    },
                    color: Colors.red,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
