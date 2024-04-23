import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = "/prodDS ";
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        actions:  [
          GestureDetector(
            onTap: (){},
              child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
        title: const Text("Product details"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: AppTheme.greyColor)
              ),
              height: 350.h,
              width: double.infinity,
              child: CarouselSlider(
                items: product.images?.map((imagePath) =>
                CachedNetworkImage(
                    imageUrl: imagePath,
                  height: double.infinity,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )
                ).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration:const Duration(milliseconds: 1200) ,
                  enlargeFactor: 0.7,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: Text(
                    product.title,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppTheme.blueColor,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                Text(
                  "EGP ${product.price}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppTheme.blueColor,
                      fontSize: 20.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsetsDirectional.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    "Sold ${product.sold}",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppTheme.blueColor
                    ),
                  ),
                ),
                SizedBox(width: 20.w,),
                Image.asset("assets/images/star_icon.png"),
                Text(
                  "${product.ratingsAverage}(${product.ratingsQuantity})",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppTheme.blueColor,
                    fontSize: 16.sp
                  ),
                )
              ],
            ),
            SizedBox(height: 12.h),
            Text(
              "Description",
              overflow: TextOverflow.fade,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppTheme.blueColor,
                fontSize: 18.sp,
              ),
            ),
            ReadMoreText(
              product.description,
              trimMode: TrimMode.Line,
              trimLines: 2,
              colorClickableText: AppTheme.greyColor,
              trimCollapsedText: 'Show more',
              trimExpandedText: 'Show less',
              moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(398.w, 64.h),
                backgroundColor: AppTheme.blueColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.r)
                ),
              ),
              onPressed: (){},
              child: Text(
                "Add to cart",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppTheme.whiteColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
