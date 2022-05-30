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
        backgroundColor: Color(0xFFFFEBC5),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Observer(builder: (_) {
                return _controller.statusCoinHistory.status == Status.loading
                    ? Lottie.network(
                        'https://assets5.lottiefiles.com/packages/lf20_wybs9m5c.json',
                        width: 300,
                        height: 300,
                        
                        ) :
                DropdownButton<String>(
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
              Observer(builder: (_) {
                return _controller.statusCoinHistory.status == Status.success
                    ? Container(
                      alignment: Alignment.center,
                      width: 300,
                      height: 400,
                      child: WidgetLineChart(coinHistory: _controller.coinHistory))
                    : Container();
              }),
            ],
          ),
        ),
      );
}
