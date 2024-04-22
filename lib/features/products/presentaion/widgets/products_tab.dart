import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/features/products/presentaion/widgets/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatelessWidget {

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  // TODO: MOVE TO CART
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        Expanded(
            child: GridView.builder(
              itemCount: 8,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing:16.h,
                    crossAxisCount: 2,
                  childAspectRatio: 191/230,
                ),
                itemBuilder: (context, index) => ProductItem(
                  imagePath: "assets/images/test_product.png",
                  label: "Nike Air Jordon Nike shoes flexible for wo..",
                  price: 1200.toString(),
                  rating: 4.8.toString(),
                ),
            ),
        )
      ],
    );
  }
}
