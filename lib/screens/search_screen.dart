import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:flutterapp/widgets/mainIcons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'search_details.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _fireStore = Firestore.instance;

  void getLaptops() async {
    final laptops = await _fireStore.collection('laptop list').getDocuments();
    for (var laptop in laptops.documents) {
      print(laptop.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.red,
      ),
      body: StreamBuilder(
          stream: _fireStore.collection('laptop list').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot laptop = snapshot.data.documents[index];
                    return Padding(
                      padding: EdgeInsets.only(left: 8, right: 8),
                      child: Card(
                        elevation: 10,
                        child: ListTile(
                          title: Text('${laptop['studentName']}'),
                          subtitle:
                              Text('Student Number ${laptop['studentNumber']}'),
                        ),
                      ),
                    );
                  });
            }
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
              context: context, builder: (context) => SearchDetails());
        },
        label: Text('Search'),
        icon: Icon(Icons.search),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
