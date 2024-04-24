import 'package:e_commerce/features/products/domain/entities/product.dart';

abstract class ProductsState{}

class ProductsInitial extends ProductsState{}

class GetAllProductsLoading extends ProductsState{}
class GetAllProductsSuccess extends ProductsState{
  final List<Product> products;

  GetAllProductsSuccess(this.products);
}
class GetAllProductsError extends ProductsState{
  final String errorMessage;

  GetAllProductsError(this.errorMessage);

}