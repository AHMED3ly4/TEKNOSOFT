import 'package:e_commerce/features/products/domain/entities/product.dart';

abstract class FavouriteStates{}
class FavouriteInitial extends FavouriteStates{}
class FavouriteLoading extends FavouriteStates{}


class GetFavouriteSuccess extends FavouriteStates{
  final List<Product> products;
  GetFavouriteSuccess(this.products);

}
class GetFavouriteError extends FavouriteStates{
  final String errorMessage;
  GetFavouriteError(this.errorMessage);

}

class AddToFavouriteSuccess extends FavouriteStates{}
class AddToFavouriteError extends FavouriteStates{
  final String errorMessage;
  AddToFavouriteError(this.errorMessage);

}

class RemoveFromFavouriteSuccess extends FavouriteStates{}
class RemoveFromFavouriteError extends FavouriteStates{
  final String errorMessage;
  RemoveFromFavouriteError(this.errorMessage);

}