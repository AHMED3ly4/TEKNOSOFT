
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/home/domain/entities/brand.dart';
import 'package:e_commerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class GetBrands{
  final  HomeRepository homeRepository;
  GetBrands({required this.homeRepository});

  Future<Either<Failure,List<Brand>>> call() async{
    return homeRepository.getBrands();
  }

}