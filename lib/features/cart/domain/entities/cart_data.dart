
import 'package:e_commerce/features/cart/data/models/products.dart';

class CartData{
  CartData({
    required this.products,
    required this.totalCartPrice,
  });
  late final List<Products>? products;

  late final int? totalCartPrice;

}