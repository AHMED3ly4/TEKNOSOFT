import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_cubit.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_states.dart';
import 'package:e_commerce/features/account/presentation/widgets/editable_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressesSection extends StatefulWidget {
  const AddressesSection({super.key, required this.cubit});
  final AccountCubit cubit;

  @override
  State<AddressesSection> createState() => _AddressesSectionState();
}

class _AddressesSectionState extends State<AddressesSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.cubit.getAddresses();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountCubit,AccountStates>(
      bloc: widget.cubit,
        listener: (_, state) {
        if(state is RemoveAddressLoading){
          UIUtils.showLoading(context);
        }else if(state is RemoveAddressSuccess){
          UIUtils.hideLoading(context);
          widget.cubit.getAddresses();
        }else if(state is RemoveAddressError){
          UIUtils.showMessage(state.errorMessage);
        }
        },
        builder: (context, state) {
          if(state is AccountError){
            UIUtils.showMessage(state.errorMessage);
            return  Text(
              "Welcome",
              style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.blueColor),
            );
          }else if(state is GetAddressesSuccess){
            final addresses = state.addresses;
            return Expanded(
              child: ListView.builder(
                itemCount: addresses.length,
                  padding: EdgeInsets.only(
                    top: 12.h
                  ),
                  itemBuilder: (context, index) => EditableTextField(
                      content: addresses[index].name,
                      label: "Address ${index+1}",
                    suffixIcon: const Icon(Icons.delete,color: Colors.red,),
                    onTabSuffixIcon: (){
                        widget.cubit.removeAddress(addresses[index].id!);
                    },
                  ),
              ),
            );
          }else if(state is AccountLoading){
            return ShimmerLoading(
              child: EditableTextField(
                content: "Address 1",
                label: "Address",
              ),
            );
          }
          return const SizedBox();
        },
    );
  }
}
