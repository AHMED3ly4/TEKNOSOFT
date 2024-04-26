import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/domain/repository/account_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class RemoveAddress{
  final AccountRepository accountRepository;

  RemoveAddress(this.accountRepository);
  Future<Either<Failure,String>> call(String addressId){
    return accountRepository.removeAddress(addressId);
  }


}