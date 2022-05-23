import 'user_model_key.dart';

class UserModel {
  String? id;
  String? email;
  String? password;
  String? firstName;
  String? lastName;
  String? token;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.token,
    });

factory UserModel.fromMap(Map<String, dynamic>map) {
  return UserModel(
    id: map[UserModelKeys.id],
    email: map[UserModelKeys.email],
    password: map[UserModelKeys.password],
    firstName: map[UserModelKeys.firstName],
    lastName: map[UserModelKeys.lastName],
    token: map[UserModelKeys.token],
  );
}

Map<String, dynamic> toMap(UserModel user) {
  return{
    UserModelKeys.id: user.id,
    UserModelKeys.email: user.email,
    UserModelKeys.password: user.password,
    UserModelKeys.firstName: user.firstName,
    UserModelKeys.lastName: user.lastName,
  };
}
}