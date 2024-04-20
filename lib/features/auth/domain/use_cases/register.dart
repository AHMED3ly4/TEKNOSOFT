import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class Register{

  final AuthRepository authRepository;
  Register({required this.authRepository});

  Future<Either<Failure,User>> call(RegisterRequest requestData) => authRepository.register(requestData);

}