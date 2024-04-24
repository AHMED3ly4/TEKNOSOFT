import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductToCartIcon extends StatelessWidget {
  AddProductToCartIcon({super.key, required this.productId});
  final CartCubit cubit = getIt.get<CartCubit>() ;
  final String? productId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit,CartStates>(
      bloc: cubit,
        builder: (context, state) {
          if(state is CartLoading){
            return CircleAvatar(
              backgroundColor: AppTheme.blueColor,
              radius: 15.r,
              child: const CircularProgressIndicator(),
            );
          }else if(state is AddToCartSuccess){
            return InkWell(
              onTap: (){
                productId != null ? cubit.removeFromCart(productId!):null;
              },
              child: CircleAvatar(
                backgroundColor: AppTheme.blueColor,
                radius: 20.r,
                child: const Icon(Icons.done,color: AppTheme.whiteColor,),
              ),
            );
          }else if(state is AddToCartError){
            UIUtils.showMessage(state.errorMessage);
          }
          return InkWell(
            onTap: (){
              productId != null ? cubit.addToCart(productId!):null;
            },
            child: Image.asset(
              'assets/images/add_icon.png',
            ),
          );
        },
    );
  }
}
