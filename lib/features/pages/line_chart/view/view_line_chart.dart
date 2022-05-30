import 'package:convert_coin/core/widgets/widget_line_chart.dart';
import 'package:convert_coin/features/pages/line_chart/controller/controller_line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/generic/resource.dart';

class ViewLineChart extends StatefulWidget {
  const ViewLineChart({Key? key}) : super(key: key);

  @override
  State<ViewLineChart> createState() => _ViewLineChartState();
}

class _ViewLineChartState extends State<ViewLineChart> {
  final _controller = ControllerLineChart();

  @override
  void initState() {
    _controller
        .getCoins()
        .whenComplete(() => _controller.getCoinHistory(_controller.coinFrom));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        backgroundColor: Color(0xFFFFEBC5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(builder: (_) {
                return DropdownButton<String>(
                  value: _controller.coinFrom,
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Color(0xFFD97236),
                  ),
                  elevation: 16,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFD97236),
                    fontSize: 20,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.transparent,
                  ),
                  onChanged: (value) async {
                    _controller.setCoinFrom(value);
                    await _controller.getCoinHistory(_controller.coinFrom);
                  },
                  items:
                      _controller.coins.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              }),
              Container(
                alignment: Alignment.center,
                width: 600,
                height: 600,
                child: Observer(builder: (_) {
                  return _controller.statusCoinHistory.status == Status.success
                      ? WidgetLineChart(coinHistory: _controller.coinHistory)
                      : Container();
                }),
              ),
            ],
          ),
        ),
      );
}
