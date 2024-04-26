class Address {
  Address({
    this.id,
    required this.name,
    required this.details,
    required this.phone,
    required this.city,
  });
  late final String? id;
  late final String name;
  late final String details;
  late final String phone;
  late final String city;

  Address.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    name = json['name'];
    details = json['details'];
    phone = json['phone'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['name'] = name;
    _data['details'] = details;
    _data['phone'] = phone;
    _data['city'] = city;
    return _data;
  }
}