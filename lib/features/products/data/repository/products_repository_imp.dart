import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/domain/repository/products_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductRepository)
class ProductRepositoryImp implements ProductRepository{
  final ProductsRemoteDataSource remoteDataSource;
  ProductRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure,List<Product>>> getAllProducts() async {

    try{
      final response = await remoteDataSource.getAllProducts();
      return Right(response.products);
    }on RemoteException catch(exception){
      return Left(Failure(exception.message));
    }
  }


}