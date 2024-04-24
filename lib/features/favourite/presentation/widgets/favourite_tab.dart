import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/cart/presentation/widgets/add_product_to_cart_button.dart';
import 'package:e_commerce/features/cart/presentation/widgets/open_cart_icon.dart';
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_cubit.dart';
import 'package:e_commerce/features/favourite/presentation/cubit/favourite_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteTab extends StatefulWidget {
  const FavouriteTab({super.key});


  @override
  State<FavouriteTab> createState() => _FavouriteTabState();
}

class _FavouriteTabState extends State<FavouriteTab> {
  final FavouriteCubit cubit = getIt.get<FavouriteCubit>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getUserFavourite();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'what are you looking for?',
                  hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.blueColor,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppTheme.blueColor,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35.r)),
                ),
              ),
            ),
            const OpenCartIcon(),
          ],
        ),
        BlocConsumer<FavouriteCubit,FavouriteStates>(
          bloc: cubit,
          listener: (_, state) {
            if(state is RemoveFromFavouriteError){
              UIUtils.showMessage(state.errorMessage);
            }else if(state is RemoveFromFavouriteSuccess){
              cubit.getUserFavourite();
            }

          },
          builder: (context, state) {
            if(state is FavouriteLoading){
              return Expanded(
                child: ListView.builder(
                  itemCount: 4,
                    itemBuilder: (context, index) => const ShimmerLoading(),
                ),
              );
            }else if(state is GetFavouriteError){
              return Center(
                child: Column(
                  children: [
                    const Icon(Icons.error),
                    Text(state.errorMessage),
                  ],
                ),
              );
            }else if(state is GetFavouriteSuccess){
              return Expanded(
                child: ListView.builder(
                  itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return Container(
                      margin: const EdgeInsetsDirectional.symmetric(vertical: 8),
                      padding: const EdgeInsetsDirectional.all(8),
                      height: 130.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: AppTheme.blackColor),
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: product.imageCover,
                            width: 120.w,
                            height: 113.h,
                            fit: BoxFit.fill,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 180.w,
                                child: Text(
                                  product.title,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppTheme.blueColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              Text(
                                "EGP ${product.price}",
                                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppTheme.blueColor,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                  onTap: () async {
                                    cubit.removeFromFavourite(product.id);
                                  },
                                  child: Image.asset("assets/images/unfavourite_icon.png")),
                              const Spacer(),
                              AddProductToCartButton(
                                productId: product.id,
                                fontSize: 14.sp,
                                padding: const EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 4),
                                loadingWidget:  SizedBox(
                                  height: 8.h,
                                  width: 4.h,

                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                    },
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
