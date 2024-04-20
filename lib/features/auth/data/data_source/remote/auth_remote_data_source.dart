import '../../models/login_request.dart';
import '../../models/login_response.dart';
import '../../models/register_request.dart';
import '../../models/register_response.dart';

abstract class AuthRemoteDataSource{
  Future<LoginResponse> login(LoginRequest requestData);
  Future<RegisterResponse> register(RegisterRequest requestData);
}