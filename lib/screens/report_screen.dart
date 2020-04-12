import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterapp/models/chart_data.dart';
import 'package:flutterapp/models/bar_chat.dart';
import 'package:flutterapp/models/pie_chat.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ReportsScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  final List<Deployment> data = [
    Deployment(
      faculty: 'FIT',
      number: 169,
      barColors: charts.ColorUtil.fromDartColor(Colors.blue[900]),
    ),
    Deployment(
      faculty: 'SMC',
      number: 98,
      barColors: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    Deployment(
      faculty: 'BCOM',
      number: 203,
      barColors: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
  ];
  final List<Deployment> pie = [
    Deployment(
      faculty: 'Ladies',
      number: 90,
      barColors: charts.ColorUtil.fromDartColor(Colors.pink),
    ),
    Deployment(
      faculty: 'Guys',
      number: 203,
      barColors: charts.ColorUtil.fromDartColor(Colors.blue[900]),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Reports'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              _auth.signOut();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 4,
            padding: EdgeInsets.all(8),
            staggeredTiles: [
              StaggeredTile.count(2, 1),
              StaggeredTile.count(2, 2),
              StaggeredTile.count(2, 1),
              StaggeredTile.count(4, 4),
            ],
            children: <Widget>[
              Card(elevation: 10, child: Icon(Icons.grid_on)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Male',
                              style: TextStyle(color: Colors.blue[900]),
                            ),
                            Text(
                              'Female',
                              style: TextStyle(color: Colors.pink[900]),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: PieChat(data: pie)),
                    ],
                  ),
                ),
              ),
              Card(elevation: 10, child: Icon(Icons.list)),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10,
                  child: BarChat(data: data),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
