import 'package:e_commerce/features/cart/data/models/products.dart';
import 'package:e_commerce/features/cart/domain/entities/cart_data.dart';

class CartDataModel extends CartData{
  CartDataModel({
    required this.id,
     this.cartOwner,
    this.createdAt,
    this.updatedAt,
    this.V,
    required super.products,
    required super.totalCartPrice,
  });
   final String id;
   final String? cartOwner;
   final String? createdAt;
   final String? updatedAt;
   final int? V;

  factory CartDataModel.fromJson(Map<String, dynamic> json)=>CartDataModel(
      id : json['_id'],
      cartOwner : json['cartOwner'],
      products : List.from(json['products']).map((e)=>Products.fromJson(e)).toList(),
  createdAt : json['createdAt'],
  updatedAt : json['updatedAt'],
  V : json['__v'],
  totalCartPrice : json['totalCartPrice'],
  );


}