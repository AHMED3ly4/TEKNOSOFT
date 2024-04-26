import 'package:e_commerce/features/auth/domain/entities/user.dart';

abstract class AccountLocalDataSource{
  Future<User> getUser();
}