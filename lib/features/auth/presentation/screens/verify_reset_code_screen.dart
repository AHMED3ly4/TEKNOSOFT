import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/utils/viladators.dart';
import 'package:e_commerce/core/widgets/defaultTextFormField.dart';
import 'package:e_commerce/core/widgets/default_elevated_button.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:e_commerce/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class VerifyResetCodeScreen extends StatelessWidget {
  VerifyResetCodeScreen({super.key});
  static const routeName= '/ VRCS';

  final codeController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthCubit _authCubit = getIt.get<AuthCubit>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.blueColor,
      body: Padding(
        padding:  EdgeInsets.all(16.w),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 90.h,
                ),
                Center(
                  child: Image.asset(
                    "assets/images/route_white_icon.png",
                    width: 237.w,
                    height: 71.1.h,
                    alignment: AlignmentDirectional.center,
                  ),
                ),
                SizedBox(
                  height: 87.h,
                  width: double.infinity,
                ),

                SizedBox(
                  height: 40.h,
                ),
                DefaultTextFormField(
                  label: "Code",
                  hint: 'Enter code sent to your email',
                  textController: codeController,
                  validator: (text){
                    if(text == null ||text!.length != 6){
                      return'un valid code';
                    }
                    return null;
                  },
                ),

                SizedBox(
                  height: 56.h,
                ),
                BlocListener<AuthCubit,AuthStates>(
                  bloc: _authCubit,
                  listener: (context, state) {
                    if(state is VerifyResetCodeLoading){
                      //show loading widget
                      UIUtils.showLoading(context);
                    }else if(state is VerifyResetCodeSuccess){
                      //hide loading widget and push to home
                      UIUtils.hideLoading(context);
                      Navigator.pushReplacementNamed(context, ResetPasswordScreen.routeName);
                    }else if(state is VerifyResetCodeError){
                      //hide loading widget and make toast
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.error);
                    }
                  },
                  child: DefaultElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        _authCubit.verifyResetCode(codeController.text);
                      }
                    },
                    label: "Reset",
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
