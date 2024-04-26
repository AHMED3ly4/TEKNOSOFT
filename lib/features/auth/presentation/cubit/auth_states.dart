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

class ForgetPasswordLoading extends AuthStates{}
class ForgetPasswordSuccess extends AuthStates{
  final String message;
  ForgetPasswordSuccess(this.message);
}
class ForgetPasswordError extends AuthStates{
  final String error;
  ForgetPasswordError(this.error);
}

class VerifyResetCodeLoading extends AuthStates{}
class VerifyResetCodeSuccess extends AuthStates{
  final String message;
  VerifyResetCodeSuccess(this.message);
}
class VerifyResetCodeError extends AuthStates{
  final String error;
  VerifyResetCodeError(this.error);
}

class ResetPasswordLoading extends AuthStates{}
class ResetPasswordSuccess extends AuthStates{
  final String token;
  ResetPasswordSuccess(this.token);
}
class ResetPasswordError extends AuthStates{
  final String error;
  ResetPasswordError(this.error);
}