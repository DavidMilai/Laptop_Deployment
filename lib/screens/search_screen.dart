import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:flutterapp/widgets/mainIcons.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InputText(hint: 'Serial NUmber', textObscure: false),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: InputText(hint: 'Serial NUmber', textObscure: false),
            ),
            CustomIconButton(
              iconType: Icons.search,
              textTitle: 'Search',
              onpress: () {},
            ),
          ],
        ),
      ),
    );
  }
}
