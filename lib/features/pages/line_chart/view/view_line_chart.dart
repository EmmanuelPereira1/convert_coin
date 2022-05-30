import 'package:convert_coin/core/widgets/widget_line_chart.dart';
import 'package:flutter/material.dart';





class ViewLineChart extends StatelessWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    
    extendBody: true,
    backgroundColor: Color(0xFFFFEBC5),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: 600,
            height: 600,
            child: WidgetLineChart(),
          ),
        ],
      ),
    ),
  );
}