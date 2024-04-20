import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/use_cases/login.dart';
import 'package:e_commerce/features/auth/domain/use_cases/register.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/login_request.dart';
@singleton
class AuthCubit extends Cubit<AuthStates>{
  final Login _login;
  final Register _register;
  AuthCubit(this._login, this._register) : super(AuthInitial());

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

}