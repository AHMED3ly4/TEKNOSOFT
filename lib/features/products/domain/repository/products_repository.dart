import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';

abstract class ProductRepository{
  Future<Either<Failure,List<Product>>> getAllProducts();

}