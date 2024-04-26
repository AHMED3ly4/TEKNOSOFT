import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_cubit.dart';
import 'package:e_commerce/features/account/presentation/cubit/account_states.dart';
import 'package:e_commerce/features/account/presentation/widgets/editable_text_field.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSection extends StatefulWidget {
   const UserSection({super.key});

  @override
  State<UserSection> createState() => _UserSectionState();
}

class _UserSectionState extends State<UserSection> {
  final cubit = getIt.get<AccountCubit>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getUser();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
        builder: (context, state) {
        if(state is AccountError){
          UIUtils.showMessage(state.errorMessage);
          return  Text(
            "Welcome,",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.blueColor),
          );
        }else if(state is GetUserSuccess){
          final user = state.user;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Welcome, ${user.name!.split(" ")[0]}",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppTheme.blueColor),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: ()async{
                      final sharedpref= await SharedPreferences.getInstance();
                      sharedpref.setString("token", "");
                      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                    },
                    icon: Icon(Icons.logout),
                  )
                ],
              ),
              Text(
                user.email!,
                style:Theme.of(context).textTheme.bodySmall!.copyWith(color: AppTheme.blueColor),
              ),
              SizedBox(height:12.h),
              EditableTextField(
                content: user.name!,
                label: "Name",
                isEditable: false,
              ),
              SizedBox(height:12.h),
              EditableTextField(
                content: user.email!,
                label: "Email",
                isEditable: false,
              ),
            ],
          );
        }else if(state is AccountLoading){
          return const ShimmerLoading();
        }
        return const SizedBox();
        },
    );
  }
}
