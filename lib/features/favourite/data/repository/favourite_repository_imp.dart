import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/data/models/cart_data_model.dart';
import 'package:e_commerce/features/favourite/data/data_sources/favourite_remote_data_source.dart';
import 'package:e_commerce/features/favourite/data/models/favourite_response.dart';
import 'package:e_commerce/features/favourite/domain/repository/favourite_repository.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: FavouriteRepository)
class FavouriteRepositoryImp implements FavouriteRepository{
final FavouriteRemoteDataSource remoteDataSource;

  FavouriteRepositoryImp(this.remoteDataSource);

  @override
  Future<Either<Failure, List<ProductModel>>> getUserFavourite() async {
    try{
      final response = await remoteDataSource.getUserFavourite();
      return Right(response.data);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, void>> addToFavourite(String productId) async {
    try{
      final response = await remoteDataSource.addToFavourite(productId);
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }





  @override
  Future<Either<Failure, void>> removeFromFavourite(String productId) async {
    try{
      final response = await remoteDataSource.removeFromFavourite(productId);
      return Right(response);
    }on AppException catch(exception){
      return Left(Failure(exception.message));
    }
  }
}