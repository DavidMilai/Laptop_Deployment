import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/inputText.dart';
import 'package:flutterapp/widgets/mainIcons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _fireStore = Firestore.instance;
  List studentName = [1];
  int a = 0;
  dynamic stdntName;

  void getData() async {
    studentName.clear();
    a = 0;
    final result = await _fireStore
        .collection("laptop list")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        stdntName = f.data['studentName'];
        studentName.insert(a, stdntName);
        a++;
      });
    });
    print(stdntName);
  }

  final spinKit = SpinKitWave(
    color: Colors.red,
    size: 50,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                getData();
                showSearch(
                    context: context,
                    delegate: DetailSearch(
                      recentStudentSearch: studentName,
                      studentName: studentName,
                    ));
              })
        ],
      ),
      body: StreamBuilder(
          stream: _fireStore.collection('laptop list').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return spinKit;
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
    );
  }
}

class DetailSearch extends SearchDelegate {
  final List studentName;
  final List recentStudentSearch;

  DetailSearch(
      {@required this.studentName, @required this.recentStudentSearch});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 100,
        child: Card(
          elevation: 20,
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentStudentSearch
        : studentName.where((p) => p.startsWith(query).toList());
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          showResults(context);
        },
        leading: Icon(Icons.local_activity),
        title: Text(recentStudentSearch[index]),
      ),
      itemCount: recentStudentSearch.length,
    );
  }
}
