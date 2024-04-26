import 'package:e_commerce/features/auth/domain/entities/user.dart';

abstract class AuthLocalDataSource{
  Future<void> saveToken(String token);
  Future<void> saveUser(User user);

  Future<String> getToken();
  Future<User> getUser();

}