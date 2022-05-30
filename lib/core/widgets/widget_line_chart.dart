import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/coin_history_model.dart';

class WidgetLineChart extends StatefulWidget {
  final ObservableList coinHistory;
  const WidgetLineChart({Key? key, required this.coinHistory})
      : super(key: key);

  @override
  State<WidgetLineChart> createState() => _WidgetLineChartState();
}

class _WidgetLineChartState extends State<WidgetLineChart> {
  @override
  Widget build(BuildContext context) => LineChart(
        LineChartData(
          minX: 0,
          maxX: 10,
          minY: 0,
          maxY: 6,

          gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: Color(0XFFF2C53D),
                  strokeWidth: 1,
                );
              },
              drawHorizontalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(color: Color(0XFFF2C53D), strokeWidth: 1);
              }),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Color(0XFFF2C53D),
              width: 1,
            ),
          ),
          //DATA LINE CHART
          lineBarsData: [
            LineChartBarData(
                spots: widget.coinHistory.map((element) {
                  final index = widget.coinHistory.indexOf(element);
                  return FlSpot(double.parse(index.toString()),
                      double.parse(element.low!));
                }).toList(),
                isCurved: true,
                color: Color(0xFFD97236),
                belowBarData: BarAreaData(
                    show: true, color: Color.fromARGB(105, 217, 114, 54)))
          ],
          //DATA LINE CHART
        ),
      );
}
