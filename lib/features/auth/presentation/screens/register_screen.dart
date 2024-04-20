import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/features/auth/data/models/register_request.dart';
import 'package:e_commerce/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_theme.dart';
import '../../../../core/utils/ui_utils.dart';
import '../../../../core/utils/viladators.dart';
import '../../../../core/widgets/defaultTextFormField.dart';
import '../../../../core/widgets/default_elevated_button.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../cubit/auth_states.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName= '/register screen';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
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
                  height: 70.h,
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
                  height: 40.h,
                ),
                DefaultTextFormField(
                  label: "Name",
                  hint: 'Enter your name',
                  textController: nameController,
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return 'name can not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 32.h,
                ),
                DefaultTextFormField(
                  label: "Phone number",
                  hint: 'Enter your number',
                  textController: phoneController,
                  validator: (text){
                    if(!Validator.isEgyptianPhoneNumber(text)){
                      return 'invalid number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 32.h,
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
                  label: "Password",
                  hint: 'Enter your password',
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
                BlocListener(
                  bloc: _authCubit,
                  listener: (context, state) {
                    if(state is RegisterLoading){
                      //show loading widget
                      UIUtils.showLoading(context);
                    }else if(state is RegisterSuccess){
                      //hide loading widget and push to home
                      UIUtils.hideLoading(context);
                      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                    }else if(state is RegisterError){
                      //hide loading widget and make toast
                      UIUtils.hideLoading(context);
                      UIUtils.showMessage(state.error);
                    }
                  },
                child: DefaultElevatedButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){
                        _authCubit.register(
                          RegisterRequest(
                            name: nameController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            rePassword: passwordController.text,
                            phone: phoneController.text,
                          ),
                        );
                      }
                    },
                  label: "Register",
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
