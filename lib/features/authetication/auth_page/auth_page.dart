import 'package:convert_coin/features/authetication/login/view/view_login.dart';
import 'package:convert_coin/features/pages/homepage/view/view_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData ){
            return  ViewHomePage();
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          } else {
            return const ViewLogin();
          }
        }),
      );
  }
}
