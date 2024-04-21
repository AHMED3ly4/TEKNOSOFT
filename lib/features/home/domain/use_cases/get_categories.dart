
import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/error/failure.dart';
import 'package:e_commerce/features/home/domain/entities/category.dart';
import 'package:e_commerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';
@singleton
class GetCategories{
final  HomeRepository homeRepository;
GetCategories({required this.homeRepository});

Future<Either<Failure,List<Category>>> call() async{
  return homeRepository.getCategories();
}

}