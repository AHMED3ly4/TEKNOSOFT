import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/data/models/address.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';

abstract class AccountRepository {
  Future<Either<Failure,String>> addAddress(AddAddressRequest requestData);

  Future<Either<Failure,String>> removeAddress(String addressId) ;

  Future<Either<Failure,List<Address>>> getAddresses() ;

  Future<Either<Failure,User>> getUser();
}