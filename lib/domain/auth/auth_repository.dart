import 'package:dartz/dartz.dart';
import 'package:testabd/core/errors/app_exception.dart';
import 'package:testabd/domain/auth/entities/register_model.dart';

abstract class AuthRepository {
  Future<Either<Messenger, RegisterModel>> register({
    required String username,
    required String email,
    required String password,
    String? referralCode,
  });

  Future<Either<Messenger, Unit>> login(String username, String password);

  Future<Either<Messenger, Unit>> logout();

  Future<Either<Messenger, Unit>> forgotPassword(String email);
}
