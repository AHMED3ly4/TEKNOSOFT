class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.rePassword,
    required this.phone,
  });
  late final String name;
  late final String email;
  late final String password;
  late final String rePassword;
  late final String phone;

  RegisterRequest.fromJson(Map<String, dynamic> json){
    name = json['name'];
    email = json['email'];
    password = json['password'];
    rePassword = json['rePassword'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['email'] = email;
    _data['password'] = password;
    _data['rePassword'] = rePassword;
    _data['phone'] = phone;
    return _data;
  }
}
