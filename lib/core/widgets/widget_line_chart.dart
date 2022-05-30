import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class WidgetLineChart extends StatelessWidget {
  const WidgetLineChart({Key? key}) : super(key: key);

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
            color:  Color(0XFFF2C53D),
            strokeWidth: 1,
          );
        },
        drawHorizontalLine: true,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Color(0XFFF2C53D),
            strokeWidth: 1
          );
        }

        ),
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
            spots: [
              FlSpot(0 , 3),
              FlSpot(1, 5),
              FlSpot(2, 2)
            ],
            isCurved: true,
            color: Color(0xFFD97236),
            belowBarData: BarAreaData(
              show: true,
              color: Color.fromARGB(105, 217, 114, 54)
            )
          )
        ],
        //DATA LINE CHART
      ),
  );
}