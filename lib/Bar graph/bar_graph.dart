import 'package:expense_tracker_app/Bar%20graph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  final double? maxY;
  final double sunAmount;
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  BarGraph({
    super.key,
    required this.maxY,
    required this.sunAmount,
    required this.monAmount,
    required this.tueAmount,
    required this.wedAmount,
    required this.thuAmount,
    required this.friAmount,
    required this.satAmount,
  });

  @override
  Widget build(BuildContext context) {
    BarData myaBardata = BarData(
        sunAmount: sunAmount,
        monAmount: monAmount,
        tueAmount: tueAmount,
        wedAmount: wedAmount,
        thuAmount: thuAmount,
        friAmount: friAmount,
        satAmount: satAmount);

    myaBardata.initialseBarData();
    return BarChart(
      BarChartData(
        maxY: 100,
        backgroundColor: Colors.green.shade100,
        barGroups: myaBardata.Bardata.map(
          (data) => BarChartGroupData(
            x: data.x,
            
            barRods: [
              BarChartRodData(toY: data.y),
            ],
          ),
        ).toList(),
      ),
    );
  }
}
