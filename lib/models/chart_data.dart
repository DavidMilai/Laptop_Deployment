import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';

class Deployment {
  final String faculty;
  final int number;
  final charts.Color barColors;
  Deployment(
      {@required this.faculty,
      @required this.number,
      @required this.barColors});
}
