import 'package:e_commerce/features/products/data/models/products_response.dart';

abstract class ProductsRemoteDataSource{

  Future<ProductsResponse> getAllProducts();
}