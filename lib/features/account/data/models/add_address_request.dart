
import 'package:e_commerce/features/account/data/models/address.dart';

class AddAddressRequest {
  AddAddressRequest({
    required this.address,

  });
  late final Address address;



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = address.name;
    _data['details'] = address.details;
    _data['phone'] = address.phone;
    _data['city'] = address.city;
    return _data;
  }
}