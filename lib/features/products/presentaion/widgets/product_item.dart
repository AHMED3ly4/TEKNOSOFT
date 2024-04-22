import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final String price;
  final String rating;
  const ProductItem({super.key, required this.imagePath, required this.label, required this.price, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Image.asset(
                imagePath,
                height: 128.h,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
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
                      label,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppTheme.blueColor,
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(height: 8.h,),
                    Text(
                      "EGP $price",
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
                          "Review ($rating)",
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
    );
  }
}
