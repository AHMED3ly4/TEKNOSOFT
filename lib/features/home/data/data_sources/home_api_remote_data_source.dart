
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_constants.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/home/data/data_sources/home_remoe_data_source.dart';
import 'package:e_commerce/features/home/data/models/brands_response.dart';
import 'package:e_commerce/features/home/data/models/category_response.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: HomeRemoteDataSource)
class HomeAPIRemoteDataSource implements HomeRemoteDataSource{

  final _dio =Dio(
    BaseOptions(
      baseUrl:APIConstants.baseURL,
    ),
  );

  @override
  Future<CategoryResponse> getCategories() async{
    try{
      final response = await _dio.get(
        APIConstants.categoriesEndPoint,
      );
      return CategoryResponse.fromJson(response.data);
    }catch(exception){
      throw RemoteException('field to get categories');
    }
  }

  @override
  Future<BrandsResponse> getBrands() async{
    try{
      final response = await _dio.get(
        APIConstants.brandsEndPoint,
      );
      return BrandsResponse.fromJson(response.data);
    }catch(exception){
      throw RemoteException('field to get categories');
    }
  }



}