import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable{

  const ProductEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,


  });
  final String id;
  final String name;
  final int price;
  final String imageUrl;
  final String description;

  @override 
  List < Object? > get props => [
    id,
    name,
    price,
    imageUrl,
    description,
    
  ];

}