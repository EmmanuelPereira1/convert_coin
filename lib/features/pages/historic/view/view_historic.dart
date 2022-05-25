import 'package:convert_coin/features/authetication/auth_page/auth_page.dart';
import 'package:convert_coin/features/authetication/login/view/view_login.dart';
import 'package:convert_coin/features/pages/historic/controller/historic_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewHistoric extends StatefulWidget {
  const ViewHistoric({Key? key}) : super(key: key);

  @override
  State<ViewHistoric> createState() => _ViewHistoricState();
}

class _ViewHistoricState extends State<ViewHistoric> {
  final _controller = HistoricController();

  @override
  void initState() {
    _controller.fetchHistoric();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBC5),
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HISTORIC',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: const Color(0xFFD97236),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const AuthPage()));
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Color(0xFFD97236),
              )),
        ],
      ),
      body: Observer(
        builder: (_) {
          return _controller.history.isNotEmpty
              ? ListView.builder(
                  itemCount: _controller.history.length,
                  itemBuilder: (context, i) {
                    final history = _controller.history[i] as Map;
                    final coinFrom = history.keys.toList()[0];
                    final historyCoinFrom = history[coinFrom] as Map;
                    final coinTo = historyCoinFrom.keys.toList()[0];
                    final historyCoinTo = historyCoinFrom[coinTo] as Map;
                    final valueFrom = historyCoinTo.keys.toList()[0];
                    final valueTo = historyCoinTo[valueFrom];
                    return ListTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  top: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  left: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  right: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                )),
                            child: Text(
                              '$valueFrom',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: const Color(0xFFD97236),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  top: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  left: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  right: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                )),
                            child: Row(
                              children: [
                                Text(
                                  '$coinFrom',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: const Color(0xFFD97236),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    color: Colors.white,
                                    child: const Icon(Icons.loop_outlined,
                                        color: Color(0xFFD97236), size: 30),
                                  ),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '$coinTo',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    color: const Color(0xFFD97236),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              '=',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: const Color(0xFFD97236),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                border: const Border(
                                  bottom: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  top: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  left: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                  right: BorderSide(
                                    color: Color(0xFFD97236),
                                  ),
                                )),
                            child: Text(
                              '$valueTo',
                              style: GoogleFonts.inter(
                                fontSize: 20,
                                color: const Color(0xFFD97236),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Text('Historic of convertions is still empty.',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    color: const Color(0xFFD97236),
                  ));
        },
      ),
    );
  }
}
