import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/favourite/domain/repository/favourite_repository.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:injectable/injectable.dart';
@singleton
class GetFavourite{
  final FavouriteRepository favouriteRepository;
  GetFavourite(this.favouriteRepository);

  Future<Either<Failure, List<ProductModel>>> call(){
    return favouriteRepository.getUserFavourite();
  }

}