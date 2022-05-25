import 'package:convert_coin/features/authetication/select_page/select_page.dart';
import 'package:convert_coin/features/pages/splash/view/view_splash.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFEBC5),
        primarySwatch: Colors.blue,
      ),
      home: const ViewSplash(),
    );
  }
}

