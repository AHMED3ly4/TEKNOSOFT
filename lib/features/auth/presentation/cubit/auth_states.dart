import 'package:e_commerce/features/auth/data/models/login_response.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';

import '../../data/models/user_model.dart';

abstract class AuthStates{}
class AuthInitial extends AuthStates{}

class LoginLoading extends AuthStates{}
class LoginSuccess extends AuthStates{
  final User user;
  LoginSuccess(this.user);
}
class LoginError extends AuthStates{
  final String error;
  LoginError(this.error);
}

class RegisterLoading extends AuthStates{}
class RegisterSuccess extends AuthStates{
  final User user;
  RegisterSuccess(this.user);
}
class RegisterError extends AuthStates{
  final String error;
  RegisterError(this.error);
}