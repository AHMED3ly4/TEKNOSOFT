import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_constants.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/account/data/data_source/remote/account_remote_data_source.dart';
import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/data/models/edit_address_response.dart';
import 'package:e_commerce/features/account/data/models/get_address_response.dart';
import 'package:e_commerce/features/auth/data/data_source/local/auth_shared_pref_local_data_source.dart';
import 'package:injectable/injectable.dart';


@Singleton(as: AccountRemoteDataSource)
class AccountAPIDataSource implements AccountRemoteDataSource{
  final _dio =Dio(
    BaseOptions(
      baseUrl:APIConstants.baseURL,
    ),
  );

  @override
  Future<String> addAddress(AddAddressRequest requestData)async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.post(
        APIConstants.addressEndPoint,
        options: Options(
          headers: {
            "token":token
          },
        ),
        data: requestData.toJson(),
      );
      final editResponse = EditAddressResponse.fromJson(response.data);
      return editResponse.message;
    }catch(exception){
      throw RemoteException("failed to add address");
    }
  }

  @override
  Future<String> removeAddress(String addressId) async{
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.delete(
        "${APIConstants.addressEndPoint}/$addressId",
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      final editResponse = EditAddressResponse.fromJson(response.data);
      return editResponse.message;
    }catch(exception){
      throw RemoteException("failed to add address");
    }
  }

  @override
  Future<GetAddressResponse> getAddresses() async {
    late final String token ;
    try{
      token = await AuthSharedPrefLocalDataSource().getToken();
    }catch(exception){
      throw LocalException('field to get token');
    }
    try{
      final response = await _dio.get(
        APIConstants.addressEndPoint,
        options: Options(
          headers: {
            "token":token
          },
        ),
      );
      return GetAddressResponse.fromJson(response.data);
    }catch(exception){
      throw RemoteException("failed to add address");
    }
  }




}