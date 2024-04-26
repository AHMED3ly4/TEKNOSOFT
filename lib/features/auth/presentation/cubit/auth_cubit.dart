import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/use_cases/forget_password.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login.dart';
import 'package:e_commerce/features/auth/domain/use_cases/register.dart';
import 'package:e_commerce/features/auth/domain/use_cases/reset_password.dart';
import 'package:e_commerce/features/auth/domain/use_cases/verify_reset_code.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/login_request.dart';
@singleton
class AuthCubit extends Cubit<AuthStates>{
  final Login _login;
  final Register _register;
  final ForgetPassword _forgetPassword;
  final VerifyResetCode _verifyResetCode ;
  final ResetPassword _resetPassword;
  AuthCubit(this._login, this._register, this._forgetPassword, this._verifyResetCode, this._resetPassword) : super(AuthInitial());

  Future<void> login(LoginRequest requestData)async{

    emit(LoginLoading());
    final result = await _login(requestData);
    result.fold(
            (failure) => emit(LoginError(failure.message)),
            (user) => emit(LoginSuccess(user)),
    );
    
  }

  Future<void> register(RegisterRequest requestData)async{

    emit(RegisterLoading());
    final result = await _register(requestData);
    result.fold(
          (failure) => emit(RegisterError(failure.message)),
          (user) => emit(RegisterSuccess(user)),
    );

  }

  Future<void> forgetPassword(String email)async{

    emit(ForgetPasswordLoading());
    final result = await _forgetPassword(email);
    result.fold(
          (failure) => emit(ForgetPasswordError(failure.message)),
          (message) => emit(ForgetPasswordSuccess(message)),
    );

  }

  Future<void> resetPassword(String email,String newPassword)async{

    emit(ResetPasswordLoading());
    final result = await _resetPassword(email,newPassword);
    result.fold(
          (failure) => emit(ResetPasswordError(failure.message)),
          (token) => emit(ResetPasswordSuccess(token)),
    );

  }


  Future<void> verifyResetCode(String code)async{

    emit(VerifyResetCodeLoading());
    final result = await _verifyResetCode(code);
    result.fold(
          (failure) => emit(VerifyResetCodeError(failure.message)),
          (message) => emit(VerifyResetCodeSuccess(message)),
    );

  }

}