import 'package:e_commerce/features/home/data/models/brands_response.dart';
import 'package:e_commerce/features/home/data/models/category_response.dart';

abstract class HomeRemoteDataSource{
  Future<CategoryResponse> getCategories();
  Future<BrandsResponse> getBrands();
}