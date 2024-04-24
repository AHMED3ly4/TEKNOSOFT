import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';

abstract class FavouriteRepository{
  Future<Either<Failure, List<ProductModel>>> getUserFavourite();
  Future<Either<Failure, void>> addToFavourite(String productId);
  Future<Either<Failure, void>> removeFromFavourite(String productId);
}