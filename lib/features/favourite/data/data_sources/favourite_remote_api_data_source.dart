import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_constants.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart';
import 'package:e_commerce/features/favourite/data/data_sources/favourite_remote_data_source.dart';
import 'package:e_commerce/features/favourite/data/models/favourite_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: FavouriteRemoteDataSource)
class FavouriteRemoteAPIDataSource implements FavouriteRemoteDataSource{

  final _dio =Dio(
    BaseOptions(
      baseUrl:APIConstants.baseURL,
    ),
  );

  @override
  Future<FavouriteResponse> getUserFavourite() async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.get(
        APIConstants.favouriteEndPoint,
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      return FavouriteResponse.fromJson(response.data);
    }catch(exception){
      throw RemoteException('field to get favourite');
    }
  }

  @override
  Future<void> addToFavourite(String productId) async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.post(
        APIConstants.favouriteEndPoint,
        data: {
          "productId": productId,
        },
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      final addResponse = response.data;
      if(addResponse["status"] != "success"){
        throw RemoteException('field to add to favourite');
      }
      return ;
    }catch(exception){
      throw RemoteException('field to add to favourite');
    }
  }

  @override
  Future<void> removeFromFavourite(String productId) async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{

      final response = await _dio.delete(
        "${APIConstants.favouriteEndPoint}/$productId",
        options: Options(
          headers: {
            "token":token
          },
        ),
      );

      final addResponse = response.data;
      if(addResponse["status"] != "success"){
        throw RemoteException('field to remove from favourite');
      }
      return ;
    }catch(exception){
      throw RemoteException('field to remove from favourite');
    }
  }

}