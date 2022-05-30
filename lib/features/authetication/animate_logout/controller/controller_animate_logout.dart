import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/generic/resource.dart';
import '../../auth_page/auth_page.dart';
part 'controller_animate_logout.g.dart';

class ControllerAnimateLogout = _ControllerAnimateLogoutBase with _$ControllerAnimateLogout;

abstract class _ControllerAnimateLogoutBase with Store {
  @observable
  Resource setupStatus = Resource.loading();

  @action
  Future <void> checkTokenValid(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));
  await FirebaseAuth.instance.signOut();
  await Navigator.push(context, 
  MaterialPageRoute(builder: 
  (context)=> AuthPage()));
  }
}