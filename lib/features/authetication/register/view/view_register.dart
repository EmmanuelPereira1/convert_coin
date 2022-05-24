import 'package:convert_coin/core/generic/resource.dart';
import 'package:convert_coin/features/authetication/auth_page/auth_page.dart';
import 'package:convert_coin/features/authetication/register/controller/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../pages/homepage/view/view_home_page.dart';

class ViewRegister extends StatelessWidget {
  ViewRegister({Key? key}) : super(key: key);

  final _controller = RegisterController();

  @override
  Widget build(BuildContext context) {
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
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Color(0xFFD97236))
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD97236)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: 'First Name',
                        ),
                        onChanged: _controller.changeFirstName,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Color(0xFFD97236))
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD97236)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: 'Last Name',
                        ),
                        onChanged: _controller.changeLastName,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Color(0xFFD97236))
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD97236)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          hintText: 'Email',
                        ),
                        onChanged: _controller.changeEmail,
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
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Color(0xFFD97236))
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD97236)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: IconButton(
                              onPressed: _controller.setPasswordVisible,
                              icon: _controller.isPasswordVisible
                                  ? const Icon(Icons.visibility,
                                  color: Color(0xFFD97236),)
                                  : const Icon(Icons.visibility_off,
                                  color: Color(0xFFD97236),)),
                          hintText: 'Password',
                        ),
                        onChanged: _controller.changePassword,
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
                          focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Color(0xFFD97236))
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFFD97236)),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          suffixIcon: IconButton(
                              onPressed:
                                  _controller.setPasswordConfirmationVisible,
                              icon: _controller.isPasswordVisible
                                  ? const Icon(Icons.visibility,
                                  color: Color(0xFFD97236),)
                                  : const Icon(Icons.visibility_off,
                                  color: Color(0xFFD97236),)),
                          hintText: 'Password Confirmation',
                        ),
                        onChanged: _controller.changePasswordConfirmation,
                      );
                    }),
                    const SizedBox(
                      height: 40,
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
                              Resource ret = await _controller.registerUser();
                              await _controller.singUp();
                              await _controller.saveCredentials();
                              if(ret.status == Status.success){
                                Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => const AuthPage()));
                              }
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
