
import 'package:e_commerce/features/account/data/models/address.dart';

class GetAddressResponse {
  GetAddressResponse({
    required this.results,
    required this.status,
    required this.addresses,
  });
  late final int results;
  late final String status;
  late final List<Address> addresses;

  GetAddressResponse.fromJson(Map<String, dynamic> json){
    results = json['results'];
    status = json['status'];
    addresses = List.from(json['data']).map((e)=>Address.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['status'] = status;
    _data['data'] = addresses.map((e)=>e.toJson()).toList();
    return _data;
  }
}