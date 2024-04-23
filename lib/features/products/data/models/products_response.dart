import 'package:e_commerce/features/products/data/models/product_model.dart';

class ProductsResponse {
  ProductsResponse({
    required this.results,
    required this.metadata,
    required this.products
  });
  late final int results;
  late final Metadata metadata;
  late final List<ProductModel> products;

  ProductsResponse.fromJson(Map<String, dynamic> json){
    results = json['results'];
    metadata = Metadata.fromJson(json['metadata']);
    products = List.from(json['data']).map((e)=>ProductModel.fromJson(e)).toList();
  }

}

class Metadata {
  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    required this.nextPage,
  });
  late final int currentPage;
  late final int numberOfPages;
  late final int limit;
  late final int nextPage;

  Metadata.fromJson(Map<String, dynamic> json){
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['numberOfPages'] = numberOfPages;
    _data['limit'] = limit;
    _data['nextPage'] = nextPage;
    return _data;
  }
}



class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });
  late final String id;
  late final String name;
  late final String slug;
  late final String category;

  Subcategory.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['category'] = category;
    return _data;
  }
}



class RatingsAverage {
  RatingsAverage({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });
  late final String id;
  late final String name;
  late final String slug;
  late final String image;

  RatingsAverage.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['image'] = image;
    return _data;
  }
}

class CreatedAt {
  CreatedAt({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });
  late final String id;
  late final String name;
  late final String slug;
  late final String image;

  CreatedAt.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['image'] = image;
    return _data;
  }
}