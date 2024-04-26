import 'package:e_commerce/features/account/data/models/address.dart';
import 'package:e_commerce/features/auth/domain/entities/user.dart';

abstract class AccountStates{}
class AccountInitial extends AccountStates{}
class AccountLoading extends AccountStates{}


class GetAddressesSuccess extends AccountStates{
  final List<Address> addresses;

  GetAddressesSuccess(this.addresses);
}
class AccountError extends AccountStates{
  final String errorMessage;

  AccountError(this.errorMessage);
}

class AddAddressLoading extends AccountStates{}
class AddAddressSuccess extends AccountStates{
  final String response;
  AddAddressSuccess(this.response);
}

class RemoveAddressLoading extends AccountStates{}
class RemoveAddressSuccess extends AccountStates{
  final String response;
  RemoveAddressSuccess(this.response);
}
class RemoveAddressError extends AccountStates{
  final String errorMessage;

  RemoveAddressError(this.errorMessage);
}

class GetUserSuccess extends AccountStates{
  final User user;
  GetUserSuccess(this.user);
}
class GetUserError extends AccountStates{
  final String errorMessage;

  GetUserError(this.errorMessage);
}



