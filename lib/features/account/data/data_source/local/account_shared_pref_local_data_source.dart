import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/account/data/data_source/local/account_local_data_source.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
@Singleton(as: AccountLocalDataSource)
class AccountSharedPrefLocalDataSource implements AccountLocalDataSource{

  @override
  Future<User> getUser() async {
    try{
      final sharedPref = await SharedPreferences.getInstance();
      return User(
        name: sharedPref.getString('name')!,
        email: sharedPref.getString('email')!,
      );
    }catch(_){
      print(_.toString());
      throw LocalException('field to get user');
    }
  }

}