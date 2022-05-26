import 'package:convert_coin/features/pages/homepage/view/view_home_page.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/generic/resource.dart';
part 'controller_success_register.g.dart';

class ControllerSuccessRegister = _ControllerSuccessRegisterBase with _$ControllerSuccessRegister;

abstract class _ControllerSuccessRegisterBase with Store {

  @observable
  Resource setupStatus = Resource.loading();

  @action
  Future <void> checkTokenValid(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 3));
  await Navigator.pushReplacement(context, 
  MaterialPageRoute(builder: 
  (context)=> ViewHomePage()));
  }
  
}