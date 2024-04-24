import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddProductToCartButton extends StatelessWidget {
  AddProductToCartButton({super.key, required this.productId, this.padding, required this.fontSize, this.width, required this.loadingWidget});
  final String? productId;
  final CartCubit cubit = getIt.get<CartCubit>() ;
  final EdgeInsetsGeometry? padding;
  final double fontSize;
  final double? width;
  final Widget loadingWidget;


  @override
  Widget build(BuildContext context) {
    Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
          color: AppTheme.blueColor,
          shape: BoxShape.rectangle,
          border: Border.all(color: AppTheme.blackColor),
          borderRadius: BorderRadius.circular(23.r)),
      child:  Text(
        "Add to cart",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: AppTheme.whiteColor,
          fontSize: 24.sp,
        ),
      ),
    );
    return BlocBuilder<CartCubit,CartStates>(
      bloc: cubit,
      builder: (context, state) {
        if(state is CartLoading){
          return Container(
              width: width,
              padding: padding,
              decoration: BoxDecoration(
                  color: AppTheme.blueColor,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: AppTheme.blackColor),
                  borderRadius: BorderRadius.circular(23.r)),
              child: Center(
                child: loadingWidget,
              )
          );
        }else if(state is AddToCartSuccess){
          return InkWell(
            onTap: (){
              productId != null ? cubit.removeFromCart(productId!):null;
            },
            child: Container(
              width: width,
              padding: padding,
              decoration: BoxDecoration(
                  color: AppTheme.blueColor,
                  shape: BoxShape.rectangle,
                  border: Border.all(color: AppTheme.blackColor),
                  borderRadius: BorderRadius.circular(23.r)),
              child: Text(
                "Added!",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.green,
                        fontSize: fontSize,
                ),
              ),
            ),
          );
        }else if(state is AddToCartError){
          UIUtils.showMessage(state.errorMessage);
        }
        return InkWell(
          onTap: (){
            productId != null ? cubit.addToCart(productId!):null;
          },
          child: Container(
            width: width,
            padding: padding,
            decoration: BoxDecoration(
                color: AppTheme.blueColor,
                shape: BoxShape.rectangle,
                border: Border.all(color: AppTheme.blackColor),
                borderRadius: BorderRadius.circular(23.r)),
            child: Text(
              "Add to cart",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppTheme.whiteColor,
                fontSize: fontSize,
              ),
            ),
          ),
        );
      },
    );
  }
}
