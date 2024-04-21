import 'package:e_commerce/features/home/data/models/brand_model.dart';

class BrandsResponse {
  BrandsResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });
  late final int results;
  late final Metadata metadata;
  late final List<BrandModel> data;

  BrandsResponse.fromJson(Map<String, dynamic> json){
    results = json['results'];
    metadata = Metadata.fromJson(json['metadata']);
    data = List.from(json['data']).map((e)=>BrandModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['results'] = results;
    _data['metadata'] = metadata.toJson();
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Metadata {
  Metadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
  });
  late final int currentPage;
  late final int numberOfPages;
  late final int limit;

  Metadata.fromJson(Map<String, dynamic> json){
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['currentPage'] = currentPage;
    _data['numberOfPages'] = numberOfPages;
    _data['limit'] = limit;
    return _data;
  }
}

