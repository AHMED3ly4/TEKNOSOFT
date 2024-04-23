import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/cart/data/models/products.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.products, required this.cubit});
  final Products products;
  final CartCubit cubit;
  @override
  Widget build(BuildContext context) {
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
            imageUrl: products.product.imageCover,
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
                  products.product.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppTheme.blueColor,
                        fontSize: 20.sp,
                      ),
                ),
              ),
              Text(
                "EGP ${products.price}",
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
                     cubit.removeFromCart(products.product.id);
                  },
                  child: const Icon(Icons.delete)),
              const Spacer(),
              Container(
                padding: const EdgeInsetsDirectional.all(4),
                decoration: BoxDecoration(
                    color: AppTheme.blueColor,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: AppTheme.blackColor),
                    borderRadius: BorderRadius.circular(23.r)),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        products.count == 1 ?
                        cubit.removeFromCart(products.product.id):
                        cubit.updateCartProductQuantity(products.product.id, products.count!-1);
                      },
                      child: const Icon(
                        Icons.remove_circle_outline,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      products.count.toString(),
                      style: const TextStyle(
                          color: AppTheme.whiteColor, fontSize: 22),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    GestureDetector(
                      onTap: (){
                        cubit.updateCartProductQuantity(products.product.id, products.count!+1);
                      },
                      child: const Icon(
                        Icons.add_circle_outline,
                        color: AppTheme.whiteColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
