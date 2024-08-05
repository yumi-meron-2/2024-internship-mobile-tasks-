import 'package:flutter/material.dart';
import 'product.dart';

class ProductProvider with ChangeNotifier{
  List<Product> _products = [
    Product(name: 'Derby Leather Shoes', price: 120, 
    category: 'Men\'s shoe', 
    description: 'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.', 
    imagePath: 'images/shoe11.png', 
    rating: 4.0 ),
    Product(name: 'Uggs Comfort Shoes', price: 299, 
    category: 'Womens\'s shoe', 
    description: 'Uggs Comfort Shoe  is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.', 
    imagePath: 'images/uggs.jpg', 
    rating: 4.5 ),
    Product(name: 'Heels', price:129, 
    category: 'Womens\'s shoe', 
    description: 'Heels Shoe  is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.', 
    imagePath: 'images/heels.jpg', 
    rating: 4.5 ),
    ];

    List<Product> get products => _products;

    void addProduct(Product product){
      _products.add(product);
      notifyListeners();
    }
    void deleteProduct(Product product){
      _products.remove(product);
      notifyListeners();
    }
}