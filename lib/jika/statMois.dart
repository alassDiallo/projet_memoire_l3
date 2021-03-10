import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatM extends StatefulWidget {
  @override
  _StatMState createState() => _StatMState();
}

class _StatMState extends State<StatM> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LineChart(LineChartData(
          minX: 0,
          maxX: 11,
          minY: 0,
          maxY: 6,
          gridData: FlGridData(
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(color: Color(0xff37434D), strokeWidth: 1);
              }),
          lineBarsData: [
            LineChartBarData(spots: [
              FlSpot(0, 3),
              FlSpot(2.6, 2),
              FlSpot(4.9, 5),
              FlSpot(6.8, 2.5),
              FlSpot(8, 4),
              FlSpot(9.5, 3),
              FlSpot(11, 4),
            ])
          ])),
    );
  }
}
