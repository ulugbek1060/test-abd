import 'package:equatable/equatable.dart';
import 'package:testabd/data/remote_source/auth/models/user_register_response.dart';

class RegisterModel with EquatableMixin {
  final int? id;
  final String? username;
  final String? email;
  final String? password;
  final String? token;
  final String? referralCode;

  RegisterModel({
    this.id,
    this.username,
    this.email,
    this.password,
    this.token,
    this.referralCode,
  });

  static RegisterModel fromResponse(UserRegisterResponse? response) {
    return RegisterModel(
      id: response?.id,
      username: response?.username,
      email: response?.email,
      token: response?.token,
      referralCode: response?.referralCode,
    );
  }

  @override
  List<Object?> get props => [
    id,
    username,
    email,
    password,
    token,
    referralCode,
  ];
}
