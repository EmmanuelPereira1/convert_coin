import 'package:convert_coin/core/generic/resource.dart';
import 'package:convert_coin/features/authetication/auth_page/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_view_controller.g.dart';

class SplashViewController = _SplashViewController with _$SplashViewController;

abstract class _SplashViewController with Store {

@observable
Resource setupStatus = Resource.loading();

@action
Future <void> checkTokenValid(BuildContext context) async {
await Future.delayed(const Duration(seconds: 3));
  await Navigator.pushReplacement(context, 
  MaterialPageRoute(builder: 
  (context)=> AuthPage()));
}
  
}