import 'package:convert_coin/core/generic/resource.dart';
import 'package:convert_coin/features/authetication/auth_page/auth_page.dart';
import 'package:convert_coin/features/authetication/login/controller/login_controller.dart';
import 'package:convert_coin/features/authetication/register/view/view_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../pages/homepage/view/view_home_page.dart';

class ViewLogin extends StatelessWidget {
  const ViewLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = LoginController();

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
                   
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide(color: Color(0xFFD97236))
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent
                              ),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onChanged: _controller.setEmail,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        obscureText: !_controller.isPasswordVisible,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          suffixIcon: IconButton(
                              onPressed: _controller.setPasswordVisible,
                              icon: _controller.isPasswordVisible
                                  ? const Icon(Icons.visibility,
                                  color: Color(0xFFD97236),)
                                  : const Icon(Icons.visibility_off,
                                  color: Color(0xFFD97236))),
                          hintText: 'Password',
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Color(0xFFD97236))
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD97236)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        onChanged: _controller.setpassword,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0XFFF2C53D)),
                            ),
                            onPressed: () async {
                               Resource ret = await _controller.loginUser();
                              await _controller.singIn();
                              if(ret.status == Status.success){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => AuthPage()));
                              }
                              
                            },
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(color: Color(0xFFD97236)),
                            )),
                      );
                    }),
                    const SizedBox(height: 14,),
                     Observer(builder: (_) {
                      return SizedBox(
                        height: 50,
                        width: 200,
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                )
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0XFFF2C53D)),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => ViewRegister())
                              );
                            },
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(color: Color(0xFFD97236)),
                            )),
                      );
                    })
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