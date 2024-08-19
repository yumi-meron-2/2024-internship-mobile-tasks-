import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductModel extends ProductEntity{
  // final String id; 
  // final String name;
  // final int price;
  // final String imageUrl; 
  // final String description;

  ProductModel({
    required super.id,//this.id, 
    required super.name,//this.name, 
    required super.price,//this.price, 
    required super.imageUrl,//this.imageUrl, 
    required super.description, //.description,
  }) ;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    
    id: json['id'], 
    name: json['name'], 

    price:(json['price'] as num?)?.toDouble() ?? 0.0, 
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
ProductEntity toEntity() => ProductEntity(id: id, name: name, price: price, imageUrl: imageUrl, description: description);

factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      imageUrl: entity.imageUrl,
      name: entity.name,
      description: entity.description,
      price: entity.price,
    );

  
}
}