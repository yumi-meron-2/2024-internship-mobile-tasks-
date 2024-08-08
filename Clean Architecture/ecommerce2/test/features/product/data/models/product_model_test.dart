import 'dart:convert';

import 'package:ecommerce2/features/product/data/models/product_model.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/json_reader.dart';
void main(){
  final testProductModel = ProductModel(id: "6672752cbd218790438efdb0", name: "Anime website", price: 123, imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg", description: "Explore anime characters.");

  test(
    'Should be a subclass of product entity',
    ()async{
      //assert
      expect(testProductModel, isA<ProductEntity>());
      
    },
  );

  test(
    'should return a valid model from json',
    () async {
      //arrange
      final Map<String, dynamic> jsonMap = json.decode(
        readJson('features/product/helpers/dummy_data/dummy_product_response.json')
      );
      //       const jsonString = '''
// {
//     "id": "6672752cbd218790438efdb0",
//     "name": "Anime website",
//     "description": "Explore anime characters.",
//     "price": 123,
//     "imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
//   }
//   ''';

      //act
      final result = ProductModel.fromJson(jsonMap);

      //expect
      expect(result, equals(testProductModel));
    }
  );

  test(
    'should return a json map containing proper data',
    ()async{
      //act
      final result = testProductModel.toJson();
      //assert
      final expectedJsonMap =  { 
        "id": "6672752cbd218790438efdb0",
        "name": "Anime website",
        "description": "Explore anime characters.",
        "price": 123,
        "imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"
      
      
      };
      //expect
      expect(result, equals(expectedJsonMap));



    }
  );
}