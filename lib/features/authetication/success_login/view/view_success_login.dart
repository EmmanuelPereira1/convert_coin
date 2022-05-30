import 'package:convert_coin/features/authetication/success_login/controller/controller_success_login.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:convert_coin/features/pages/splash/controller/splash_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class ViewSuccessLogin extends StatefulWidget {
  const ViewSuccessLogin({Key? key}) : super(key: key);

  @override
  State<ViewSuccessLogin> createState() => _ViewSuccessLoginState();
}

class _ViewSuccessLoginState extends State<ViewSuccessLogin> {
final _controller = ControllerSuccessLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFEBC5),
      body: Center(
        child: Observer(builder: (_) {
          _controller.checkTokenValid(context);
          return Lottie.network('https://assets6.lottiefiles.com/packages/lf20_pqnfmone.json',
          repeat: false);
        }),
      ),
    );
  }
}