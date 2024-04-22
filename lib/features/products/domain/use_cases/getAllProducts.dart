import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetAllProducts{
  final ProductRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure,List<Product>>> call()async{
    return repository.getAllProducts();
  }
}