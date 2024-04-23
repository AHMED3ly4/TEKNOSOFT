import 'package:e_commerce/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter/material.dart';

class OpenCartIcon extends StatelessWidget {
  const OpenCartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, CartScreen.routeName);
        },
        child: const Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        ),
      ),
    );
  }
}
