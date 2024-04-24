import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/data/models/cart_data_model.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: CartRepository)
class CartRepositoryImp implements CartRepository{
final CartRemoteDataSource remoteDataSource;
  CartRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, CartDataModel>> getUserCart() async {
    try{
      final response = await remoteDataSource.getUserCart();
      return Right(response.cartData);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(String productId) async {
    try{
      final response = await remoteDataSource.addToCart(productId);
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> clearUserCart() async {
    try{
      final response = await remoteDataSource.clearUserCart();
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }



  @override
  Future<Either<Failure, void>> removeFromCart(String productId) async {
    try{
      final response = await remoteDataSource.removeFromCart(productId);
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> updateCartProductQuantity(String productId, int updatedQuantity) async {
    try{
      final response = await remoteDataSource.updateCartProductQuantity(productId, updatedQuantity);
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }


}