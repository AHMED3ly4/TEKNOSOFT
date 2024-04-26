import 'package:e_commerce/features/account/data/models/address.dart';

class EditAddressResponse {
  EditAddressResponse({
    required this.status,
    required this.message,
    required this.addresses,
  });
  late final String status;
  late final String message;
  late final List<Address> addresses;

  EditAddressResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    addresses = List.from(json['data']).map((e)=>Address.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = addresses.map((e)=>e.toJson()).toList();
    return _data;
  }
}

