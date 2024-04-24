import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddToFavouriteIcon extends StatelessWidget {
  AddToFavouriteIcon({super.key, required this.productId});
  final FavouriteCubit cubit = getIt.get<FavouriteCubit>() ;
  final String? productId;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCubit,FavouriteStates>(
      bloc: cubit,
      builder: (context, state) {
        if(state is FavouriteLoading){
          return CircleAvatar(
            backgroundColor: AppTheme.blueColor,
            radius: 15.r,
            child: const CircularProgressIndicator(),
          );
        }else if(state is AddToFavouriteSuccess){
          return InkWell(
            onTap: (){
              productId != null ? cubit.removeFromFavourite(productId!):null;
            },
            child: CircleAvatar(
              backgroundColor: AppTheme.blueColor,
              radius: 20.r,
              child: const Icon(Icons.done,color: AppTheme.whiteColor,),
            ),
          );
        }else if(state is AddToFavouriteError){
          UIUtils.showMessage(state.errorMessage);
        }
        return InkWell(
          onTap: (){
            productId != null ? cubit.addToFavourite(productId!):null;
          },
          child: Image.asset(
            "assets/images/heart_icon.png",
          ),
        );
      },
    );
  }
}
