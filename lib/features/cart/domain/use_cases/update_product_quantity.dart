import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class UpdateProductQuantity{
  final CartRepository cartRepository;
  UpdateProductQuantity(this.cartRepository);

  Future<Either<Failure,void>> call(String productId, int updatedQuantity) async {
    return cartRepository.updateCartProductQuantity(productId, updatedQuantity);
  }


}