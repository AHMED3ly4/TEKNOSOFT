
import 'package:e_commerce/features/auth/domain/entities/user.dart';

class UserModel extends User{
  UserModel({
    required super.name,
    required super.email,
  });


  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      name: json['name'],
      email: json['email'],
  );

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    return _data;
  }
}