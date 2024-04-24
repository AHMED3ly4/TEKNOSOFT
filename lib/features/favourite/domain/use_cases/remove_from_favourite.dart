import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/favourite/domain/repository/favourite_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class RemoveFromFavourite{
  final FavouriteRepository favouriteRepository;
  RemoveFromFavourite(this.favouriteRepository);

  Future<Either<Failure, void>> call(String productId){
    return favouriteRepository.removeFromFavourite(productId);
  }

}