import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/generic/resource.dart';
import '../../../../core/models/user_model.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
 final _dio = Dio();

@observable
  UserModel user = UserModel();

 @observable 
 String email = '';

 @action
 void setEmail(newValue) => email = newValue;

 @observable 
 String password = '';

 @action
 void setpassword(newValue) => password = newValue;

 @action 
  Future singIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, password: password,
    );
  }

  @action
  Future<Resource<void, String>> loginUser() async {
    try{
      final result = await _dio.post("https://academy-auth.herokuapp.com/login",
      data: {
        'password' : password,
        'email' : email,
      },
      options: Options(headers: {"x-access-token": 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjI3MTU4OThlNGE5MDE1YzgxZDVlYTE1IiwiZW1haWwiOiJwZWRybzEzQHRlc3RlLmNvbSIsImlhdCI6MTY1MTYwMzgwOCwiZXhwIjoxNjU0MTk1ODA4fQ.Jjh6UyXmfNICuqxyNzFybRfZ4hLo4zKZZ8Mteqz-Sf8',}));
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
  
}