import 'package:enfluwence/utills/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatefulWidget {
  const LineChart({super.key});

  @override
  State<LineChart> createState() => _LineChartState();
}

class _LineChartState extends State<LineChart> {
  List chartData = [
    [2021, 0, 55],
    [2022, 39, 40],
    [2023, 20, 54],
    [2024, 55, 100],
    [2025, 54, 55],
    [2026, 40, 60],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              // Text("Chat will display here"),

              SfCartesianChart(
            primaryYAxis: NumericAxis(
              numberFormat: NumberFormat.compact(),
            ),
            title: ChartTitle(
              text: "Post Engagement Analytics",
            ),
            series: [
              SplineSeries(
                dataSource: chartData,
                xValueMapper: (data, index) => data[0],
                yValueMapper: (data, index) => data[1],
                name: "Post View",
                color: AColor.blue,
                width: 4,
              ),
              SplineSeries(
                dataSource: chartData,
                xValueMapper: (data, index) => data[0],
                yValueMapper: (data, index) => data[2],
                name: "Post Engagement",
                width: 4,
              ),
            ],
          ),
        ));
  }
}
