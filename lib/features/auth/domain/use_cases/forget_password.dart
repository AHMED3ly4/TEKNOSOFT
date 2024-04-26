
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class ForgetPassword{
  final AuthRepository authRepository;
  ForgetPassword({required this.authRepository});

  Future<Either<Failure,String>> call(String email) async {
    return authRepository.forgetPassword(email);
  }

}