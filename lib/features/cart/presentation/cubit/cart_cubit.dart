import 'package:e_commerce/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/clear_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/getCart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/remove_from_cart.dart';
import 'package:e_commerce/features/cart/domain/use_cases/update_product_quantity.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class CartCubit extends Cubit<CartStates>{
  CartCubit(this.getCartUC, this.addToCartUC, this.clearCartUC, this.removeFromCartUC, this.updateProductQuantityUC): super(CartInitial());
  final GetCart getCartUC;
  final AddToCart addToCartUC;
  final ClearCart clearCartUC;
  final RemoveFromCart removeFromCartUC;
  final UpdateProductQuantity updateProductQuantityUC;

  Future<void> getUserCart() async {
    emit(CartLoading());
    final result= await getCartUC();
    result.fold(
            (failure) => emit(GetCartError(failure.message)),
            (cartData) => emit(GetCartSuccess(cartData)),
    );
  }

  Future<void> addToCart(String productId)async {
    emit(CartLoading());
    final result= await addToCartUC(productId);
    result.fold(
          (failure) => emit(AddToCartError(failure.message)),
          (_) => emit(AddToCartSuccess()),
    );
  }

  Future<void> removeFromCart(String productId)async {
    emit(CartLoading());
    final result= await removeFromCartUC(productId);
    result.fold(
          (failure) => emit(RemoveFromCartError(failure.message)),
          (_) => emit(RemoveFromCartSuccess()),
    );
  }

  Future<void> updateCartProductQuantity(String productId,int updatedQuantity)async {
    emit(CartLoading());
    final result= await updateProductQuantityUC(productId,updatedQuantity);
    result.fold(
          (failure) => emit(UpdateProductQuantityError(failure.message)),
          (_) => emit(UpdateProductQuantitySuccess()),
    );
  }
  Future<void> clearUserCart()async {
    emit(CartLoading());
    final result= await clearCartUC();
    result.fold(
          (failure) => emit(ClearCartError(failure.message)),
          (_) => emit(ClearCartSuccess()),
    );
  }
}