
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class ResetPassword{
  final AuthRepository authRepository;
  ResetPassword({required this.authRepository});

  Future<Either<Failure,String>> call(String email,String newPassword) async {
    return authRepository.resetPassword(email, newPassword);
  }

}