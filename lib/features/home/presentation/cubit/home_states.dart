import 'package:e_commerce/features/home/domain/entities/brand.dart';
import 'package:e_commerce/features/home/domain/entities/category.dart';

abstract class HomeStates{}

class HomeInitial extends HomeStates{}


class GetCategoriesLoading extends HomeStates{}
class GetCategoriesSuccess extends HomeStates{
  final List<Category> categories;

  GetCategoriesSuccess({required this.categories});

}
class GetCategoriesError extends HomeStates{
  final String errorMessage;

  GetCategoriesError({required this.errorMessage});

}

class GetBrandsLoading extends HomeStates{}
class GetBrandsSuccess extends HomeStates{
  final List<Brand> brands;

  GetBrandsSuccess({required this.brands});

}
class GetBrandsError extends HomeStates{
  final String errorMessage;

  GetBrandsError({required this.errorMessage});

}
