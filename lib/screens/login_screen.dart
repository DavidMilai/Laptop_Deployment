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

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  bool isLoading = false;
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  onClear() {
    setState(() {
      emailTextController.text = "";
      passwordTextController.text = "";
    });
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

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
          color: Colors.blueAccent.withOpacity(animation.value),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: Hero(
                        tag: 'logo',
                        child: Image(
                          image: AssetImage('assets/SU.png'),
                          height: animation.value * 500,
                        ),
                      ),
                    ),
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
                      controller: emailTextController,
                    ),
                    SizedBox(height: 10),
                    InputText(
                      hint: 'Password',
                      textObscure: true,
                      onChange: (value) {
                        password = value;
                      },
                      controller: passwordTextController,
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
                        onClear();
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
                            setState(() {
                              isLoading = false;
                            });
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
