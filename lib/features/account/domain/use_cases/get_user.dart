import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/account/data/models/address.dart';
import 'package:e_commerce/features/account/domain/repository/account_repository.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetUser{
  final AccountRepository accountRepository;

  GetUser(this.accountRepository);
  Future<Either<Failure,User>> call(){
    return accountRepository.getUser();
  }


}