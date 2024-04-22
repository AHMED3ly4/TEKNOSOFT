import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:e_commerce/features/products/presentaion/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';

class ProductItem extends StatelessWidget {
 final Product? product;

  const ProductItem({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,
          ProductDetailsScreen.routeName,
        arguments: product,
        );
      },
      child: Container(
        margin: EdgeInsetsDirectional.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
            border: Border.all(
                color: Colors.grey.shade300
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.r)
        ),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                product !=null ?
                CachedNetworkImage(
                  imageUrl: product!.imageCover,
                  height: 128.h,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>ShimmerLoading(
                    child: SizedBox(
                      height: 128.h,
                      width: double.infinity,
                    ),
                  ),
                  errorListener: (value) => SizedBox(),
                )
                    : Image.asset("assets/images/test_product.png"),
                Image.asset(
                  'assets/images/heart_icon.png',
                ),

              ],
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.w),
              child: Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product !=null ? product!.title : 'Product',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blueColor,
                          fontSize: 15.sp,
                        ),
                      ),
                      SizedBox(height: 8.h,),
                      Text(
                        "EGP ${product!=null ? product!.price : 1200.toString()}",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppTheme.blueColor,
                          fontSize: 15.sp,

                        ),
                      ),
                      SizedBox(height: 8.h,),
                      Row(
                        children: [
                          Text(
                            "Review (${product!=null ? product!.ratingsAverage : 4.8.toString()})",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppTheme.blueColor,
                              fontSize: 15.sp,

                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Image.asset("assets/images/star_icon.png"),

                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/add_icon.png',
                  ),
                ],
              ),

            ),

          ],
        ),
      ),
    );
  }
}
