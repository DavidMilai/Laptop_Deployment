import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:flutterapp/widgets/mainIcons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: StreamBuilder<Object>(
          stream: Firestore.instance.collection('laptop list').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading');
            } else {
              return ListView.builder();
            }
          }),
    );
  }
}
