import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity{
  // final String id; 
  // final String name;
  // final int price;
  // final String imageUrl; 
  // final String description;

  ProductModel({
    required String id,//this.id, 
    required String name,//this.name, 
    required int price,//this.price, 
    required String imageUrl,//this.imageUrl, 
    required String description, //.description,
  }) : super(id: id, name: name, price: price, imageUrl: imageUrl, description: description) ;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'], 
    name: json['name'], 
    price: json['price'], 
    imageUrl: json['imageUrl'], 
    description: json['description']
  );
  Map < String, dynamic > toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'price': price,
    'imageUrl': imageUrl,
  
  };

}