import 'package:e_commerce/features/products/data/models/product_model.dart';

class FavouriteResponse {
  FavouriteResponse({
    required this.status,
    required this.count,
    required this.data,
  });
  late final String status;
  late final int count;
  late final List<ProductModel> data;

  FavouriteResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    count = json['count'];
    data = List.from(json['data']).map((e)=>ProductModel.fromJson(e)).toList();
  }


}

