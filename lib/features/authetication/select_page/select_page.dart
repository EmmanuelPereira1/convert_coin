import 'package:convert_coin/core/generic/resource.dart';
import 'package:convert_coin/features/authetication/auth_page/auth_page.dart';
import 'package:convert_coin/features/authetication/google_sign_in/controller/google_sign_in_controller.dart';
import 'package:convert_coin/features/authetication/login/view/view_login.dart';
import 'package:flutter/material.dart';

class ViewSelectPage extends StatelessWidget {
  const ViewSelectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = ControllerGoogleSingIn();

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          'lib/assets/coin.png',
                          height: 170,
                          width: 170,
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0XFFF2C53D)),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ViewLogin()));
                        },
                        child: const Text(
                          "LOG IN WITH AN ACCOUNT",
                          style: TextStyle(color: Color(0xFFD97236)),
                        ),
                      ),
                    ),
                   const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          )),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0XFFF2C53D)),
                        ),
                        onPressed: () async {
                          await _controller.googleLogin();
                          await _controller.saveCredentialsGoogle();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AuthPage(),
                              ),
                            );
                        },
                        child: const Text(
                          "LOG IN BY GOOGLE ACCOUNT",
                          style: TextStyle(color: Color(0xFFD97236)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
