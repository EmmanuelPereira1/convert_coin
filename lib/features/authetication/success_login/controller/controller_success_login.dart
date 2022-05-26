import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/generic/resource.dart';
import '../../auth_page/auth_page.dart';
part 'controller_success_login.g.dart';

class ControllerSuccessLogin = _ControllerSuccessLoginBase with _$ControllerSuccessLogin;

abstract class _ControllerSuccessLoginBase with Store {

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