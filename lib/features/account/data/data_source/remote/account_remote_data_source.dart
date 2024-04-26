import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/data/models/edit_address_response.dart';
import 'package:e_commerce/features/account/data/models/get_address_response.dart';

abstract class AccountRemoteDataSource{
  Future<String> addAddress(AddAddressRequest requestData);
  Future<String> removeAddress(String addressId);
  Future<GetAddressResponse> getAddresses();
}