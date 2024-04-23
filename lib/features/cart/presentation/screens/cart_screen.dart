import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart screen ";
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartCubit cubit = getIt.get<CartCubit>();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit.getUserCart();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<CartCubit,CartStates>(
          bloc: cubit,
          builder: (context, state) {
            if(state is CartLoading){
              return ShimmerLoading(child: SizedBox());
            }else if(state is GetCartError){
              return  Center(child: Text(state.errorMessage),);
            }else if(state is GetCartSuccess){
              final cartData = state.cartData;
              return ListView.builder(
                itemCount: cartData.products?.length ?? 0,
                  itemBuilder: (_, index) {
                  final  products = cartData.products?[index];
                    return  Container(
                      padding: EdgeInsetsDirectional.all(8),
                    height: 130.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: AppTheme.blackColor
                      ),
                      borderRadius: BorderRadius.circular(15.r)
                    ),
                    child: Row(
                      children: [
                        CachedNetworkImage(
                            imageUrl: products!.product.imageCover,
                          width: 120.w,
                          height: 113.h,
                          fit: BoxFit.fill,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(products.product.title,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: AppTheme.blueColor,
                                fontSize: 20.sp,
                              ),
                            ),
                            Text("EGP ${products.price}",
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: AppTheme.blueColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: (){},
                                child: Icon(Icons.delete)
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsetsDirectional.all(4),
                              decoration: BoxDecoration(
                                color: AppTheme.blueColor,
                                  shape: BoxShape.rectangle,
                                  border: Border.all(
                                      color: AppTheme.blackColor
                                  ),
                                  borderRadius: BorderRadius.circular(23.r)
                              ),
                              child: Row(
                                children: [
                                  const Icon(Icons.add_circle_outline,color: AppTheme.whiteColor,),
                                  SizedBox(width: 8.w,),
                                  Text(products.count.toString(),
                                  style: TextStyle(color: AppTheme.whiteColor,fontSize: 22),
                                  ),
                                  SizedBox(width: 8.w,),
                                  const Icon(Icons.remove_circle_outline,color: AppTheme.whiteColor,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                  },
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
