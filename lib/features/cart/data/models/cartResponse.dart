import 'package:e_commerce/features/cart/data/models/cart_data_model.dart';
import 'package:e_commerce/features/products/data/models/product_model.dart';
import 'package:e_commerce/features/products/data/models/products_response.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';

class CartResponse {
  CartResponse({
    required this.status,
    required this.numOfCartItems,
    required this.cartData,
  });
  late final String status;
  late final int? numOfCartItems;
  late final CartDataModel cartData;

  CartResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartData = CartDataModel.fromJson(json['data']);
  }

}






