import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convert_coin/features/authetication/animate_logout/view/view_animate_logout.dart';
import 'package:convert_coin/features/authetication/login/view/view_login.dart';
import 'package:convert_coin/features/pages/historic/controller/historic_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/generic/resource.dart';

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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HISTORIC',
          style: GoogleFonts.inter(
            fontSize: 20,
            color: const Color(0xFFD97236),
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ViewAnimateLogout()));
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Color(0xFFD97236),
              )),
        ],
      ),
      body: Center(
        child: Observer(
          builder: (_) {
            return _controller.history.isNotEmpty
                ? _controller.loadingPage.status == Status.loading
                    ? Lottie.network(
                        'https://assets2.lottiefiles.com/packages/lf20_oo9n3jl8.json',
                        width: 600,
                        height: 600)
                    : ListView.builder(
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
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
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
                                        fontSize: 14,
                                        color: const Color(0xFFD97236),
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  height: 50,
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
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(16),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                              right: 4, left: 4),
                                          color: Colors.white,
                                          child: const Icon(Icons.loop_outlined,
                                              color: Color(0xFFD97236),
                                              size: 25),
                                        ),
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
                                  padding: const EdgeInsets.all(4),
                                  child: Text(
                                    '=',
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      color: const Color(0xFFD97236),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
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
                                        fontSize: 14,
                                        color: const Color(0xFFD97236),
                                      ),
                                      overflow: TextOverflow.fade,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  child: IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Deleting from Firebase',
                                                style: GoogleFonts.inter(
                                                  fontSize: 20,
                                                  color:
                                                      const Color(0xFFD97236),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              content: Text(
                                                'Would you like to delete this conversion?',
                                                style: GoogleFonts.inter(
                                                  fontSize: 16,
                                                  color:
                                                      const Color(0xFFD97236),
                                                ),
                                              ),
                                              backgroundColor:
                                                  const Color(0xFFFFEBC5),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              actions: [
                                                Observer(builder: (_) {
                                                  return ElevatedButton(
                                                    onPressed: () async {
                                                      await FirebaseFirestore
                                                          .instance
                                                          .collection('users')
                                                          .doc(FirebaseAuth
                                                              .instance
                                                              .currentUser!
                                                              .uid)
                                                          .update({
                                                        "history": FieldValue
                                                            .arrayRemove(
                                                                [history])
                                                      });
                                                      _controller
                                                          .fetchHistoric();
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'Yes',
                                                      style: GoogleFonts.inter(
                                                        fontSize: 20,
                                                        color: const Color(
                                                            0xFFD97236),
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      shape: MaterialStateProperty.all<
                                                              RoundedRectangleBorder>(
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16),
                                                      )),
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all<Color>(
                                                        const Color(0xFFF2D16D),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'No',
                                                    style: GoogleFonts.inter(
                                                      fontSize: 20,
                                                      color: const Color(
                                                          0xFFD97236),
                                                    ),
                                                  ),
                                                  style: ButtonStyle(
                                                    shape: MaterialStateProperty
                                                        .all<RoundedRectangleBorder>(
                                                            RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                    )),
                                                    backgroundColor:
                                                        MaterialStateProperty
                                                            .all<Color>(
                                                      const Color(0xFFF2D16D),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.delete_outlined,
                                        color: Colors.red),
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
      ),
    );
  }
}
