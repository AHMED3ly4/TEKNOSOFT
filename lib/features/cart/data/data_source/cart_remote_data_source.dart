import 'package:e_commerce/features/cart/data/models/cartResponse.dart';

abstract class CartRemoteDataSource{
  Future<void> addToCart(String productId);
  Future<void> removeFromCart(String productId);
  Future<void> updateCartProductQuantity(String productId,int updatedQuantity);
  Future<CartResponse> getUserCart();
  Future<void> clearUserCart();
}