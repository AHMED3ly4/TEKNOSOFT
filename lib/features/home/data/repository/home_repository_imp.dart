import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/core/error/failure.dart';

import 'package:e_commerce/features/home/domain/entities/brand.dart';
import 'package:e_commerce/features/home/domain/entities/category.dart';
import 'package:e_commerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: HomeRepository)
class HomeRepositoryImp extends HomeRepository{
HomeRepositoryImp({required super.remoteDataSource});

  @override
  Future<Either<Failure,List<Category>>> getCategories() async {
    try{
      final categoryResponse = await remoteDataSource.getCategories();
      return Right(categoryResponse.data);
    }on RemoteException catch(exception){
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure,List<Brand>>> getBrands() async {
    try{
      final brandResponse = await remoteDataSource.getBrands();
      return Right(brandResponse.data);
    }on RemoteException catch(exception){
      return Left(Failure(exception.message));
    }
  }
}