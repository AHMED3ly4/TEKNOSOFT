import 'package:e_commerce/features/home/data/models/brand_model.dart';
import 'package:e_commerce/features/home/data/models/category_model.dart';
import 'package:e_commerce/features/products/data/models/products_response.dart';
import 'package:e_commerce/features/products/domain/entities/product.dart';

class ProductModel extends Product{
    ProductModel({
      required super.sold,
      required super.images,
      required this.subcategory,
      required super.ratingsQuantity,
      required this.reId,
      required super.title,
      required this.slug,
      required super.description,
      required super.quantity,
      required super.price,
      required super.imageCover,
      required super.ratingsAverage,
      required this.createdAt,
      required this.updatedAt,
      required super.id,
    });

    late final List<Subcategory>? subcategory;
    late final String reId;
    late final String slug;
    late final String? createdAt;
    late final String? updatedAt;

    factory ProductModel.fromJson(Map<String, dynamic> json)=> ProductModel(
        sold : json['sold'],
        images : List.castFrom<dynamic, String>(json['images']),
        subcategory  :List.from(json['subcategory']).map((e)=>Subcategory.fromJson(e)).toList(),
        ratingsQuantity : json['ratingsQuantity'],
        reId : json['_id'],
        title :json['title'],
        slug  :json['slug'],
        description : json['description'],
        quantity :json['quantity'],
        price : json['price'],
        imageCover : json['imageCover'],
       createdAt : json['createdAt'],
       updatedAt : json['updatedAt'],
       id : json['id'],
      ratingsAverage: json["ratingsAverage"],
    );


}