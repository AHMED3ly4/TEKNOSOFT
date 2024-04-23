import 'package:e_commerce/features/cart/domain/entities/cart_data.dart';

abstract class CartStates{}
class CartInitial extends CartStates{}
class CartLoading extends CartStates{}


class GetCartSuccess extends CartStates{
  final CartData cartData;
  GetCartSuccess(this.cartData);
}
class GetCartError extends CartStates{
  final String errorMessage;

  GetCartError(this.errorMessage);
}

class AddToCartSuccess extends CartStates{}
class AddToCartError extends CartStates{
  final String errorMessage;

  AddToCartError(this.errorMessage);
}

class ClearCartSuccess extends CartStates{}
class ClearCartError extends CartStates{
  final String errorMessage;

  ClearCartError(this.errorMessage);
}

class RemoveFromCartSuccess extends CartStates{}
class RemoveFromCartLoading extends CartStates{}
class RemoveFromCartError extends CartStates{
  final String errorMessage;

  RemoveFromCartError(this.errorMessage);
}

class UpdateProductQuantitySuccess extends CartStates{}
class UpdateProductQuantityError extends CartStates{
  final String errorMessage;

  UpdateProductQuantityError(this.errorMessage);
}
