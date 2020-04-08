import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:flutterapp/screens/home_screen.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    String email;
    String password;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Laptop Deployment'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
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
                child: ListView(
                  children: <Widget>[
                    InputText(
                      hint: 'Email',
                      textObscure: false,
                      onChange: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(height: 10),
                    InputText(
                      hint: 'Password',
                      textObscure: true,
                      onChange: (value) {
                        password = value;
                      },
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
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final user = await _auth.signInWithEmailAndPassword(
                              email: email, password: password);
                          if (user != null) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          }
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Incorrect username or password"),
                                );
                              });
                        }
                      },
                      color: Colors.red,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
