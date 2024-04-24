import 'package:e_commerce/features/favourite/data/models/favourite_response.dart';

abstract class FavouriteRemoteDataSource{
  Future<FavouriteResponse> getUserFavourite();
  Future<void> addToFavourite(String productId);
  Future<void> removeFromFavourite(String productId);
}