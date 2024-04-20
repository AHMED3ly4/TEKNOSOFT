import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class Login{

  final AuthRepository authRepository;
  Login({required this.authRepository});

  Future<Either<Failure,User>> call(LoginRequest requestData) => authRepository.login(requestData);

}