import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class WidgetLineChart extends StatefulWidget {
  final ObservableList coinHistory;
  const WidgetLineChart({Key? key, required this.coinHistory})
      : super(key: key);

  @override
  State<WidgetLineChart> createState() => _WidgetLineChartState();
}

class _WidgetLineChartState extends State<WidgetLineChart> {
  @override
  Widget build(BuildContext context) {
    final miny = widget.coinHistory
        .map((el) => double.tryParse(el.low))
        .reduce((curr, next) {
      final x = curr != null ? curr : 0;
      final y = next != null ? next : 0;

      if (x < y)
        return curr;
      else
        return next;
    });
    final maxy = widget.coinHistory
        .map((el) => double.tryParse(el.low))
        .reduce((curr, next) {
      final x = curr != null ? curr : 0;
      final y = next != null ? next : 0;

      if (x > y)
        return curr;
      else
        return next;
    });

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 25,
        minY: miny,
        maxY: maxy,
        titlesData: FlTitlesData(
            show: true,
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
              ),
            ),
            rightTitles: AxisTitles(
              drawBehindEverything: false,
            ),
            topTitles: AxisTitles(
              drawBehindEverything: false,
            ),
            bottomTitles: AxisTitles(
              drawBehindEverything: false,
            ),
          ),
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
                return FlSpot(
                    double.parse(index.toString()), double.parse(element.low!));
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
}
