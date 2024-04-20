
import 'package:e_commerce/core/error/app_exception.dart';
import 'package:e_commerce/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefLocalDataSource implements AuthLocalDataSource{


  @override
  Future<void> saveToken(String token) async{
    try{
      final sharedPref = await SharedPreferences.getInstance();
      await sharedPref.setString('token', token);
    }catch(_){
      throw LocalException('field to save token');
    }
  }

  @override
  Future<String> getToken() async{
    try{
      final sharedPref = await SharedPreferences.getInstance();
      return sharedPref.getString('token')!;
    }catch(_){
      throw LocalException('field to get token');
    }
  }

}