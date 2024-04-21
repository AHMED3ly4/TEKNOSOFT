import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/home/data/data_sources/home_remoe_data_source.dart';
import 'package:e_commerce/features/home/domain/entities/brand.dart';
import 'package:e_commerce/features/home/domain/entities/category.dart';

abstract class HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  HomeRepository({required this.remoteDataSource});

  Future<Either<Failure,List<Category>>> getCategories();
  Future<Either<Failure,List<Brand>>> getBrands();
}