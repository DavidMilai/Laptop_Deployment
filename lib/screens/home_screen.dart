import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'add_screen.dart';
import 'search_screen.dart';
import 'report_screen.dart';
import 'package:flutterapp/widgets/mainIcons.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Home'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                children: <Widget>[Icon(Icons.lock), Text('Logout')],
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Image.asset(
                    'assets/SU.png',
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Welcome Milai',
                    style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomIconButton(
                        iconType: Icons.search,
                        textTitle: 'Search',
                        onpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SearchScreen()));
                        },
                      ),
                      CustomIconButton(
                        iconType: Icons.edit,
                        textTitle: 'Edit',
                        onpress: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      CustomIconButton(
                        iconType: Icons.library_books,
                        textTitle: 'Reports',
                        onpress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ReportsScreen()));
                        },
                      ),
                      CustomIconButton(
                        iconType: Icons.remove_red_eye,
                        textTitle: 'History',
                        onpress: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  CustomIconButton(
                    iconType: Icons.add,
                    textTitle: 'Add',
                    onpress: () {
                      showModalBottomSheet(
                          context: context, builder: (context) => AddScreen());
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
