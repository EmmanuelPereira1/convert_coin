import 'package:convert_coin/features/authetication/register/view/pages/convert/controller/convert_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class ConvertPageWidget extends StatefulWidget {
  ConvertPageWidget({Key? key}) : super(key: key);

  @override
  State<ConvertPageWidget> createState() => _ConvertPageWidgetState();
}

class _ConvertPageWidgetState extends State<ConvertPageWidget> {
  final _controller = ConvertPageController();

  @override
  void initState() {
    _controller.getCoins();
    _controller.getCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('lib/assets/dollar.png'),
          Text(
            'CONVERT',
            style: GoogleFonts.inter(
                color: const Color.fromRGBO(217, 114, 54, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Observer(builder: (_) {
            return TextField(
              onChanged: _controller.setValueFrom,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color.fromRGBO(217, 114, 54, 1),
                  ),
                ),
              ),
            );
          }),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    await _controller.getCoin();
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
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  color: const Color(0xFFF2D16D),
                  child: const Icon(Icons.loop_outlined,
                      color: Color(0xFFD97236), size: 30),
                ),
              ),
              Observer(builder: (_) {
                return DropdownButton<String>(
                  value: _controller.coinTo,
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
                    _controller.setCoinTo(value);
                    await _controller.getCoin();
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
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Total',
            style: GoogleFonts.inter(
              fontSize: 20,
              color: const Color(0xFFD97236),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Observer(builder: (_) {
            return Text(
              _controller.coin == null
                  ? 'You need to select a different coin!'
                  : '${_controller.valueTo.toStringAsFixed(2)}',
              style: GoogleFonts.inter(
                color: const Color(0xFFD97236),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            );
          })
        ],
      ),
    );
  }
}
