import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/cart/data/models/cart_data_model.dart';
import 'package:e_commerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class GetCart{
final CartRepository cartRepository;
  GetCart(this.cartRepository);

    Future<Either<Failure,CartDataModel>> call() async {
   return cartRepository.getUserCart();
  }


}