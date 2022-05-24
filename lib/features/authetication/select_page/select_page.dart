import 'package:convert_coin/features/authetication/login/view/view_login.dart';
import 'package:flutter/material.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);

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
                          height: 170,
                          width: 170,
                        ),
                      ),
                    ),
                    
                    SizedBox(
                      height: 50,
                      width: 200,
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
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ViewLogin()));
                        },
                        child: const Text(
                          "LOG IN WITH AN ACCOUNT",
                          style: TextStyle(color: Color(0xFFD97236)),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      width: 200,
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
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const ViewLogin()));
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
