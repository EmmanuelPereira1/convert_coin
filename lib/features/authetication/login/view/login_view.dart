import 'package:convert_coin/core/generic/resource.dart';
import 'package:convert_coin/features/authetication/login/controller/login_controller.dart';
import 'package:convert_coin/features/authetication/register/view/pages/homepage/view/home_page.dart';
import 'package:convert_coin/features/authetication/register/view/view_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
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
                      return OutlinedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0XFFF2C53D)),
                          ),
                          onPressed: () async {
                             Resource ret = await _controller.loginUser();
                            await _controller.singIn();
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
                            "LOGIN",
                            style: TextStyle(color: Color(0xFFD97236)),
                          ));
                    }),
                    const SizedBox(height: 14,),
                     Observer(builder: (_) {
                      return OutlinedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0XFFF2C53D)),
                          ),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => ViewRegister())
                            );
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