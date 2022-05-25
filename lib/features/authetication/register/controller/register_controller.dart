import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convert_coin/core/generic/resource.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/models/user_model.dart';
part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final _dio = Dio();

  @observable
  UserModel user = UserModel();

  @observable
  String email = '';

  @action
  void changeEmail(String newValue) => email = newValue;

  @computed
  bool get isEmailValid =>
    email.contains('@') && email.contains('.com') && email.isNotEmpty;
  
  @observable
  String firstName = '';

  @action
  void changeFirstName(String newValue) => firstName = newValue;

  @computed
  bool get isFirstNameValid => firstName.isNotEmpty;

  @observable
  String lastName = '';

  @action
  void changeLastName(String newValue) => lastName = newValue;

  @computed
  bool get isLastNameValid => lastName.isNotEmpty;


  @observable
  String password = '';

  @action 
  void changePassword (String newValue) => password = newValue;

  @computed
  bool get isPasswordValid => password.length > 7;

  @observable 
  String passwordConfirmation = '';

  @action
  void changePasswordConfirmation(String newValue) => passwordConfirmation = newValue;

  @computed 
  bool get isPasswordConfirmationValid => passwordConfirmation == password;

  @computed
  bool get isFormValid => isEmailValid && isPasswordValid && isPasswordConfirmationValid;

  @action
  Future<Resource<void, String>> registerUser() async {
    try{
      final result = await _dio.post("https://academy-auth.herokuapp.com/register",
      data: {
        'first_name': firstName,
        'last_name' : lastName,
        'password' : password,
        'email' : email,
      });
      user = UserModel.fromMap(result.data);

      return Resource.success();
    } on DioError catch (e) {
      return Resource.failed(error: e.response!.toString());
    }
  }

  @observable
  bool isPasswordVisible = false;

  @action 
  void setPasswordVisible() => isPasswordVisible = !isPasswordVisible;

  @observable 
  bool isPasswordConfirmationVisible = false;

  @action 
  void setPasswordConfirmationVisible() =>
    isPasswordConfirmationVisible = !isPasswordConfirmationVisible;

  @observable
  bool isButtonAtLoadingState = false;
  
  @action 
  void setButtonAtLoadingState() => isButtonAtLoadingState = true;

  @computed 
  bool get areCredentialsValid =>
    isEmailValid &&
    isFirstNameValid &&
    isLastNameValid &&
    isPasswordValid &&
    isPasswordConfirmationValid;

  @action 
  Future<void> saveCredentials() async {
    
      final firestore = FirebaseFirestore.instance;
    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser?.uid != null) {
      await firestore.collection('users').doc(currentUser!.uid).set({
        'first_name': firstName,
        'last_name' : lastName,
        'password' : password,
        'email' : email,
        'history' : [],
      });
    }
  }

  @action 
  Future singUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email, password: password,
    );
  }
 }