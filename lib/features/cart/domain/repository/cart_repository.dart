import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/data/models/cart_data_model.dart';

abstract class CartRepository{
  Future<Either<Failure,void>> addToCart(String productId);
  Future<Either<Failure,void>> removeFromCart(String productId);
  Future<Either<Failure,void>> updateCartProductQuantity(String productId,int updatedQuantity);
  Future<Either<Failure,CartDataModel>> getUserCart();
  Future<Either<Failure,void>> clearUserCart();

}