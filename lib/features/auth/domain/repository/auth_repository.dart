import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';

import '../../data/models/login_request.dart';

abstract class AuthRepository{
  Future<Either<Failure,User>> login(LoginRequest requestData);
  Future<Either<Failure,User>> register(RegisterRequest requestData);
  Future<Either<Failure,String>> forgetPassword(String email);
  Future<Either<Failure,String>> verifyResetCode(String code);
  Future<Either<Failure,String>> resetPassword(String email,String newPassword);
}