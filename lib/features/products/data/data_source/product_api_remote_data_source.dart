
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_constants.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/products/data/data_source/products_remote_data_source.dart';
import 'package:e_commerce/features/products/data/models/products_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: ProductsRemoteDataSource)
class ProductsAPIRemoteDataSource implements ProductsRemoteDataSource{
  final _dio =Dio(
    BaseOptions(
      baseUrl:APIConstants.baseURL,
    ),
  );

  @override
  Future<ProductsResponse> getAllProducts() async{
    try{
      final response = await _dio.get(
        APIConstants.allProductsEndPoint,
      );
      return ProductsResponse.fromJson(response.data);
    }catch(exception){
      throw RemoteException('field to get products');
    }
  }

}