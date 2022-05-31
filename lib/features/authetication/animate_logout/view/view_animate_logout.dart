import 'package:convert_coin/features/authetication/animate_logout/controller/controller_animate_logout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class ViewAnimateLogout extends StatefulWidget {
  const ViewAnimateLogout({Key? key}) : super(key: key);

  @override
  State<ViewAnimateLogout> createState() => _ViewAnimateLogoutState();
}

class _ViewAnimateLogoutState extends State<ViewAnimateLogout> {

  final _controller = ControllerAnimateLogout();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBC5),
      body: Center(
        child: Observer(builder: (_) {
          _controller.checkTokenValid(context);
          return Lottie.network('https://assets4.lottiefiles.com/packages/lf20_bdb0zm60.json',
          repeat: true);
        }),
      ),
    );
  }
}