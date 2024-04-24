import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/favourite/domain/repository/favourite_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class AddToFavourite{
  final FavouriteRepository favouriteRepository;
  AddToFavourite(this.favouriteRepository);

  Future<Either<Failure, void>> call(String productId){
    return favouriteRepository.addToFavourite(productId);
  }

}