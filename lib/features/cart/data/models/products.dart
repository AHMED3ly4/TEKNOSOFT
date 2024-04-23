
class Products {
  Products({
    required this.count,
    required this.id,
    required this.product,
    required this.price,
  });
  late final int? count;
  late final String id;
  late final CartProduct product;
  late final int? price;

  Products.fromJson(Map<String, dynamic> json){
    count = json['count'];
    id = json['_id'];
    product = CartProduct.fromJson(json['product']);
    price = json['price'];
  }

}

class CartProduct {
  CartProduct({
    required this.title,
    required this.quantity,
    required this.imageCover,
    required this.ratingsAverage,
    required this.id,
  });
  late final String title;
  late final int quantity;
  late final String imageCover;
  late final double ratingsAverage;
  late final String id;

  CartProduct.fromJson(Map<String, dynamic> json){
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }


}
