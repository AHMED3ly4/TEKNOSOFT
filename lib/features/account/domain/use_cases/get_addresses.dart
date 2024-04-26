import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/account/data/models/address.dart';
import 'package:e_commerce/features/account/domain/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAddresses{
  final AccountRepository accountRepository;

  GetAddresses(this.accountRepository);
  Future<Either<Failure,List<Address>>> call(){
    return accountRepository.getAddresses();
  }


}