import 'package:convert_coin/core/generic/resource.dart';
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
                    Observer(builder: (_) {
                      return TextField(
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
                          ),
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
                          hintText: 'Last Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
                          ),
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
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
                          ),
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
                          suffixIcon: IconButton(
                              onPressed: _controller.setPasswordVisible,
                              icon: _controller.isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
                          ),
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
                          suffixIcon: IconButton(
                              onPressed:
                                  _controller.setPasswordConfirmationVisible,
                              icon: _controller.isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off)),
                          hintText: 'Password Confirmation',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        onChanged: _controller.changePasswordConfirmation,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),
                    Observer(builder: (_) {
                      return OutlinedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0XFFF2C53D)),
                          ),
                          onPressed: () async {
                            Resource ret = await _controller.registerUser();
                            await _controller.singUp();
                            await _controller.saveCredentials();
                            if(ret.status == Status.success){
                              Navigator.push(context, 
                              MaterialPageRoute(builder: (context) => HomePageWidget()));
                            }
                          },
                          icon: const Icon(
                            Icons.app_registration_outlined,
                            color: Colors.white,
                          ),
                          label: const Text(
                            "REGISTER",
                            style: TextStyle(color: Color(0xFFD97236)),
                          ));
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
