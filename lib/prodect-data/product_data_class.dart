class product{
  String? id;
  String? name;
  String? category;
  String? imageUrl;
  String? oldPrice;
  String? price;

  product();

  product.fromJson(Map<String,dynamic>data){
    id=data['id'] as String?;
    category=data['category']as String?;
    name=data['name']as String?;
    imageUrl=data['imageUrl']as String?;
    oldPrice=data['oldPrice']as String?;
    price=data['price']as String?;
  }

Map<String,dynamic> toJson() {
  return {
    "id": id,
    "category": category,
    "name": name,
    "imageUrl": imageUrl,
    "oldPrice": oldPrice,
    "price": price,
  };
}
}