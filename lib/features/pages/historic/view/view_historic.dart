import 'package:convert_coin/features/authetication/auth_page/auth_page.dart';
import 'package:convert_coin/features/authetication/login/view/view_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewHistoric extends StatelessWidget {
  const ViewHistoric({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: const Color(0xFFFFEBC5),
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: Hero(tag: 'logo', child: Image.asset('lib/assets/coin.png',
            height: 40,
            width: 40,)),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AuthPage() 
                        )
                      );
          },
          icon: const Icon(Icons.logout_outlined,
          color: Color(0xFFD97236),)
          ),
        ],
        
      ),
      body: Container(
        child: const Text('Teste 2')),
    );
  }
}
