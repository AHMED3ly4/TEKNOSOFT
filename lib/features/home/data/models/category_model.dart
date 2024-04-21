import 'package:e_commerce/features/home/domain/entities/category.dart';

class CategoryModel extends Category{
  CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  late final String? slug;
  late final String? createdAt;
  late final String? updatedAt;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id : json['_id'],
      name : json['name'],
      slug : json['slug'],
  image : json['image'],
  createdAt : json['createdAt'],
  updatedAt : json['updatedAt'],
  );



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['slug'] = slug;
    _data['image'] = image;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    return _data;
  }
}