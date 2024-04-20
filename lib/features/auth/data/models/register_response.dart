import 'user_model.dart';

class RegisterResponse {
  RegisterResponse({
    required this.message,
    required this.user,
    required this.token,
  });
  late final String? message;
  late final UserModel? user;
  late final String? token;

  RegisterResponse.fromJson(Map<String, dynamic> json){
    message = json['message'];
    user = UserModel.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['user'] = user?.toJson();
    _data['token'] = token;
    return _data;
  }
}
