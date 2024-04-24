import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_constants.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart';
import 'package:e_commerce/features/cart/data/data_source/cart_remote_data_source.dart';
import 'package:e_commerce/features/cart/data/models/cartResponse.dart';
import 'package:injectable/injectable.dart';
@Singleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource{

  final _dio =Dio(
    BaseOptions(
      baseUrl:APIConstants.baseURL,
    ),
  );

  @override
  Future<CartResponse> getUserCart() async{
    late final String token ;
    try{
       token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.get(
        APIConstants.cartEndPoint,
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      return CartResponse.fromJson(response.data);
    }catch(exception){
      throw RemoteException('field to get cart');
    }
  }



  @override
  Future<void> addToCart(String productId) async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.post(
        APIConstants.cartEndPoint,
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
        throw RemoteException('field to add to cart');
      }
      return ;
    }catch(exception){
      throw RemoteException('field to add to cart');
    }
  }

  @override
  Future<void> clearUserCart() async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }

    try{
      final response = await _dio.delete(
        APIConstants.cartEndPoint,
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      final deleteResponse = response.data;
      if(deleteResponse["message"] != "success"){
        throw RemoteException('field to clear cart');
      }
      return;
    }catch(exception){
      throw RemoteException('field to clear cart');
    }
  }



  @override
  Future<void> removeFromCart(String productId) async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.delete(
        "${APIConstants.cartEndPoint}/$productId",
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      final removeResponse = response.data;
      if(removeResponse["status"] != "success"){
        throw RemoteException('field to add to cart');
      }
      return ;
    }catch(exception){
      throw RemoteException('field to add to cart');
    }
  }

  @override
  Future<void> updateCartProductQuantity(String productId,int updatedQuantity) async {
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.put(
        "${APIConstants.cartEndPoint}/$productId",
        options: Options(
          headers: {
            "token":token
          },
        ),
        data: {
          "count": updatedQuantity.toString(),
        },
      );
      final updateResponse = response.data;
      if(updateResponse["status"] != "success"){
        throw RemoteException('field to add to cart');
      }
      return ;
    }catch(exception){
      throw RemoteException('field to add to cart');
    }
  }


}