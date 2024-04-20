
import 'package:dio/dio.dart';
import 'package:e_commerce/core/api_constants.dart';
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:e_commerce/features/auth/data/models/login_request.dart';
import 'package:e_commerce/features/auth/data/models/login_response.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/data/models/register_response.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRemoteDataSource)
class AuthRemoteAPIDataSource implements AuthRemoteDataSource {
  final _dio =Dio(
  BaseOptions(
    baseUrl:APIConstants.baseURL,
  ),
);

  @override
  Future<LoginResponse> login(LoginRequest requestData) async {
    try{
      final response = await _dio.post(
        APIConstants.loginEndPoint,
        data: requestData.toJason(),
      );
      return LoginResponse.fromJson(response.data);
    }catch(exception){
      var message = 'field to login';
      if(exception is DioException){
        final errorMessage = exception.response?.data['message'] ;
        if(errorMessage != null) message = errorMessage;
      }
      throw RemoteException(message);
    }
  }

  @override
  Future<RegisterResponse> register(RegisterRequest requestData) async {
    try{
      final response = await _dio.post(
        APIConstants.registerEndPoint,
        data: requestData.toJson(),
      );
      return RegisterResponse.fromJson(response.data);
    }catch(exception){
      var message = 'field to register';
      if(exception is DioException){
        final errorMessage = exception.response?.data['message'] ;
        if(errorMessage != null) message = errorMessage;
      }
      throw RemoteException(message);
    }
  }

}