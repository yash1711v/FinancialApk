
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../Screens/Summery/IncomePoints.dart';
class LineChartWidget extends StatelessWidget {
  final List<IncomePoints> points;
  const LineChartWidget(this.points,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: LineChart((LineChartData(
          lineBarsData:[
            LineChartBarData(
              spots: points.map((point) => FlSpot(point.x as double,point.y)).toList(),
              isCurved: true,
              dotData: FlDotData(show: true),

            )
          ]))),
    );
  }
}
