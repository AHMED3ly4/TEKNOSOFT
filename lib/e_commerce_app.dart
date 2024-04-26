import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/account/presentation/screens/add_address_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:e_commerce/features/auth/presentation/screens/verify_reset_code_screen.dart';
import 'package:e_commerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:e_commerce/features/home/presentation/screens/home_screen.dart';
import 'package:e_commerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ECommerceApp extends StatelessWidget {
  const ECommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          HomeScreen.routeName: (context) =>  HomeScreen(),
          ProductDetailsScreen.routeName: (context) =>  const ProductDetailsScreen(),
          CartScreen.routeName: (context) =>  const CartScreen(),
          AddAddressScreen.routeName: (context) =>   AddAddressScreen(),
          ForgetPasswordScreen.routeName: (context) =>   ForgetPasswordScreen(),
          VerifyResetCodeScreen.routeName: (context) =>   VerifyResetCodeScreen(),
          ResetPasswordScreen.routeName: (context) =>   const ResetPasswordScreen(),
        },
      ),
    );
  }
}
