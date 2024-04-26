import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/utils/viladators.dart';
import 'package:e_commerce/core/widgets/defaultTextFormField.dart';
import 'package:e_commerce/core/widgets/default_elevated_button.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:e_commerce/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatefulWidget {
  static const routeName= '/ RPS';

  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool hidePassword=true;

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
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(
                  height: 40.h,
                ),
                DefaultTextFormField(
                  label: "E-mail",
                  hint: 'Enter your email',
                  textController: emailController,
                  validator: (text){
                    if(!Validator.isEmail(text)){
                      return'un valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                DefaultTextFormField(
                  label: "new Password",
                  hint: 'Enter your new password',
                  textController: passwordController,
                  validator: (text){
                    if(!Validator.hasMinLength(text, 6)){
                      return'password must me more than 6 characters';
                    }
                    return null;

                  },
                  isPassword: hidePassword,
                  suffixIcon: IconButton(
                    icon: hidePassword ? const Icon(Icons.visibility_sharp) : const Icon(Icons.visibility_off),
                    onPressed: (){
                      hidePassword = !hidePassword;
                      setState(() {

                      });
                    }  ,
                  ),
                ),
                SizedBox(
                  height: 56.h,
                ),
                BlocListener<AuthCubit,AuthStates>(
                  bloc: _authCubit,
                  listener: (context, state) {
                    if(state is ResetPasswordLoading){
                      //show loading widget
                      UIUtils.showLoading(context);
                    }else if(state is ResetPasswordSuccess){
                      //hide loading widget and push to home
                      UIUtils.hideLoading(context);
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                    }else if(state is ResetPasswordError){
                      //hide loading widget and make toast
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.error);
                    }
                  },
                  child: DefaultElevatedButton(
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        _authCubit.resetPassword(emailController.text, passwordController.text);
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
