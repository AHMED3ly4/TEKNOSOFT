import 'package:e_commerce/features/account/data/models/add_address_request.dart';
import 'package:e_commerce/features/account/domain/use_cases/add_address.dart';
import 'package:e_commerce/features/account/domain/use_cases/get_addresses.dart';
import 'package:e_commerce/features/account/domain/use_cases/get_user.dart';
import 'package:e_commerce/features/account/domain/use_cases/remove_address.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class AccountCubit extends Cubit<AccountStates>{
  AccountCubit(this.getAddressesUC, this.addAddressUC, this.getUserUC, this.removeAddressUC) : super(AccountInitial());
  final GetAddresses getAddressesUC;
  final AddAddress addAddressUC;
  final GetUser getUserUC;
  final RemoveAddress removeAddressUC;

  Future<void> getAddresses () async {
    emit(AccountLoading());
    final result = await getAddressesUC();
    result.fold(
            (failure) => emit(AccountError(failure.message)),
            (addresses) => emit(GetAddressesSuccess(addresses)),
    );
  }

  Future<void> addAddress (AddAddressRequest requestData) async {
    emit(AddAddressLoading());
    final result = await addAddressUC(requestData);
    result.fold(
          (failure) => emit(AccountError(failure.message)),
          (response) => emit(AddAddressSuccess(response)),
    );
  }

  Future<void> removeAddress (String addressId) async {
    emit(RemoveAddressLoading());
    final result = await removeAddressUC(addressId);
    result.fold(
          (failure) => emit(RemoveAddressError(failure.message)),
          (response) => emit(RemoveAddressSuccess(response)),
    );
  }

  Future<void> getUser () async {
    emit(AccountLoading());
    final result = await getUserUC();
    result.fold(
          (failure) => emit(AccountError(failure.message)),
          (user) => emit(GetUserSuccess(user)),
    );
  }

}