import 'package:e_commerce/core/gi/service_locator.dart';
import 'package:e_commerce/core/indicators/shimmer_loading.dart';
import 'package:e_commerce/core/theming/app_theme.dart';
import 'package:e_commerce/core/utils/ui_utils.dart';
import 'package:e_commerce/core/widgets/default_elevated_button.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:e_commerce/features/cart/presentation/cubit/cart_state.dart';
import 'package:e_commerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  static const routeName = "/cart screen ";
  const CartScreen({super.key});

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
        padding: const EdgeInsets.only(
          top: 8,
          right: 8,
          left: 8,
          bottom: 4
        ),
        child: BlocConsumer<CartCubit,CartStates>(
          bloc: cubit,
          listener:(context, state) {
            if(state is RemoveFromCartSuccess || state is UpdateProductQuantitySuccess ){
              cubit.getUserCart();
            }else if(state is RemoveFromCartError ){
              UIUtils.showMessage(state.errorMessage);
            }else if(state is UpdateProductQuantityError){
              UIUtils.showMessage(state.errorMessage);
            }
          },
          builder: (context, state) {
            if(state is CartLoading){
              return ListView.builder(
                itemCount: 8,
                  itemBuilder: (context, index) => const ShimmerLoading(),
              ) ;
            }else if(state is GetCartError){
              return  Center(child: Column(
                children: [
                  const Icon(Icons.error),
                  Text(state.errorMessage),
                ],
              ),);
            }else if(state is GetCartSuccess){
              final cartData = state.cartData;

              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartData.products?.length ?? 0,
                        itemBuilder: (_, index) {
                        final  products = cartData.products?[index];
                          return CartItem(products: products!, cubit: cubit) ;
                        },
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Total Price \nEGP ${cartData.totalCartPrice}",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppTheme.blueColor,
                          fontSize: 18.sp
                        ),
                      ),
                      Expanded(
                        child: DefaultElevatedButton(
                          textColor: AppTheme.whiteColor,
                          backgroundColor: AppTheme.blueColor,
                            onPressed: (){
                            UIUtils.showMessage("Used Api does not provide this");
                            },
                            label: "Checkout",

                        ),
                      )
                    ],
                  )
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
