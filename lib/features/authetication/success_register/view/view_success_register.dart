import 'package:convert_coin/features/authetication/success_register/controller/controller_success_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class ViewSuccessRegister extends StatefulWidget {
  const ViewSuccessRegister({Key? key}) : super(key: key);

  @override
  State<ViewSuccessRegister> createState() => _ViewSuccessRegisterState();
}

class _ViewSuccessRegisterState extends State<ViewSuccessRegister> {
final _controller = ControllerSuccessRegister();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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