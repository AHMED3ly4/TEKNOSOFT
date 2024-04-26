
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/account/data/data_source/local/account_local_data_source.dart';
import 'package:e_commerce/features/account/data/data_source/remote/account_remote_data_source.dart';
import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/data/models/address.dart';
import 'package:e_commerce/features/account/domain/repository/account_repository.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AccountRepository)
class AccountRepositoryImp implements AccountRepository{
final AccountLocalDataSource localDataSource;
final AccountRemoteDataSource remoteDataSource;

  AccountRepositoryImp(this.localDataSource, this.remoteDataSource);


  @override
  Future<Either<Failure,String>> addAddress(AddAddressRequest requestData)async{
    try{
      final response = await remoteDataSource.addAddress(requestData);
      return Right(response);
    }catch(exception){
      return Left(Failure(exception.toString()));
    }

  }

  @override
  Future<Either<Failure,String>> removeAddress(String addressId) async{
    try{
      final response = await remoteDataSource.removeAddress(addressId);
      return Right(response);
    }catch(exception){
      return Left(Failure("failed to remove address"));
    }
  }

  @override
  Future<Either<Failure,List<Address>>> getAddresses() async{
  try{
    final response = await remoteDataSource.getAddresses();
    return Right(response.addresses);
  }catch(exception){
    return Left(Failure("failed to get addresses"));
  }
}

  @override
  Future<Either<Failure,User>> getUser() async{
  try{
    final response = await localDataSource.getUser();
    return Right(response);
  }catch(exception){
    return Left(Failure("failed to get user"));
  }
}

}