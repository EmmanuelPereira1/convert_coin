import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/generic/resource.dart';
import '../controller/convert_page_controller.dart';

class ViewConvertPage extends StatefulWidget {
  ViewConvertPage({Key? key}) : super(key: key);

  @override
  State<ViewConvertPage> createState() => _ViewConvertPageState();
}

class _ViewConvertPageState extends State<ViewConvertPage> {
  final _controller = ConvertPageController();
  final _textControlller = TextEditingController();

  @override
  void initState() {
    _controller.getCoins();
    _controller.getCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBC5),
      extendBody: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Hero(
          tag: 'logo',
          child: Image.asset(
            'lib/assets/coin.png',
            height: 40,
            width: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Observer(builder: (_) {
                return Lottie.network(
                    'https://assets2.lottiefiles.com/packages/lf20_oo9n3jl8.json',
                    animate: _controller.statusButton.status == Status.loading,
                    width: 300,
                    height: 300);
              }),
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
                  controller: _textControlller,
                  onChanged: _controller.setValueFrom,
                  style: GoogleFonts.inter(fontSize: 16),
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
                      items: _controller.coins
                          .map<DropdownMenuItem<String>>((value) {
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
                      items: _controller.coins
                          .map<DropdownMenuItem<String>>((value) {
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
              ElevatedButton(
                onPressed: () async {
                  if (_controller.coin != null &&
                      _controller.valueFrom.isNotEmpty) {
                    await _controller.convertTo();
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Storing to Firebase',
                              style: GoogleFonts.inter(fontSize: 20),
                            ),
                            content: Text(
                              'Would you like to store this conversion?',
                              style: GoogleFonts.inter(fontSize: 16),
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  _controller.addFirebase();
                                  _textControlller.text = '';
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Yes',
                                  style: GoogleFonts.inter(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xFFF2D16D),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _textControlller.text = '';
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'No',
                                  style: GoogleFonts.inter(fontSize: 20),
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  )),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                    const Color(0xFFF2D16D),
                                  ),
                                ),
                              )
                            ],
                          );
                        });
                  } else {
                    _controller.setValueTo(
                        'You need to fill a value or select another coin!');
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    const Color(0xFFF2D16D),
                  ),
                ),
                child: Text(
                  'CONVERT NOW',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: const Color(0xFFD97236),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Observer(builder: (_) {
                return Text(
                  _controller.valueTo,
                  style: GoogleFonts.inter(
                    color: const Color(0xFFD97236),
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
