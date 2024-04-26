import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_cubit.dart';
import 'package:e_commerce/features/account/presentation/screens/add_address_screen.dart';
import 'package:e_commerce/features/account/presentation/widgets/addresses_section.dart';
import 'package:e_commerce/features/account/presentation/widgets/editable_text_field.dart';
import 'package:e_commerce/features/account/presentation/widgets/user_section.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountTab extends StatelessWidget {
  final AccountCubit cubit = getIt.get<AccountCubit>();

   AccountTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/images/route_blue.png",
          width: 66.w,
          height: 22.h,
          fit: BoxFit.fill,
        ),
        SizedBox(
          height: 16.h,
        ),
         UserSection(),
        EditableTextField(
            content: "Address Name",
            label: "Add Address",
          suffixIcon: Icon(Icons.add),
          onTabSuffixIcon: (){
              Navigator.pushNamed(
                context,
                AddAddressScreen.routeName,
                arguments: cubit,
              );
          },
        ),
        AddressesSection(
          cubit: cubit,
        ),
      ],
    );
  }
}
