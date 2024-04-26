import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource,required this.authLocalDataSource});

  @override
  Future<Either<Failure,User>> login(LoginRequest requestData)async{
    try{
      final response = await authRemoteDataSource.login(requestData);
      if (response.token != null && response.user != null) {
        authLocalDataSource.saveToken(response.token!);
        authLocalDataSource.saveUser(response.user!);
        return Right(response.user!);
      } else {
        return Left(Failure());
      }
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }





  @override
  Future<Either<Failure,User>> register(RegisterRequest requestData)async{
    try{
      final response = await authRemoteDataSource.register(requestData);
      if (response.token != null && response.user != null) {
        authLocalDataSource.saveToken(response.token!);
        authLocalDataSource.saveUser(response.user!);
        return Right(response.user!);
      } else {
        return Left(Failure());
      }
    } on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure,String>> forgetPassword(String email)async{
    try{
      final response = await authRemoteDataSource.forgetPassword(email);

      return Right(response);
    } on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure,String>> verifyResetCode(String code) async{
    try{
      final response = await authRemoteDataSource.verifyResetCode(code);
      return Right(response);
    } on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure,String>> resetPassword(String email,String newPassword) async{
    try{
      final token = await authRemoteDataSource.resetPassword(email, newPassword);
      authLocalDataSource.saveToken(token);
      authLocalDataSource.saveUser(User(name: " ", email: email));
      return Right(token);
    } on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }


}