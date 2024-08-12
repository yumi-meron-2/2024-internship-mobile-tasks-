import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/product/core/error/exceptions.dart';
import 'package:ecommerce2/features/product/core/error/failure.dart';
import 'package:ecommerce2/features/product/data/models/product_model.dart';
import 'package:ecommerce2/features/product/data/repositories/produt_repository_impl.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';
void main(){
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late ProductRepositoryImpl productRepositoryImpl;

  setUp((){
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepositoryImpl = ProductRepositoryImpl(productRemoteDataSource: mockProductRemoteDataSource);

  });
  final testProductModel = ProductModel(id: '6672752cbd218790438efdb0', name: "Anime website", price: 123, imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg", description: "Explore anime characters.");
  final testProductEntity = ProductEntity(id: '6672752cbd218790438efdb0', name: "Anime website", price: 123, imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg", description: "Explore anime characters.");
  const testId = "6672752cbd218790438efdb0";
   var myJson = json.decode(readJson('features/product/helpers/dummy_data/dummy_product_response.json'))['data'] as List<dynamic>;
  var listOfProductModel = myJson.map((model) => (ProductModel.fromJson(model))).toList() as List<ProductModel>;
  var listOfProduct = listOfProductModel.map((model) => model.toEntity()).toList();
  group('get product', () {
    test(
    'Should return product when a call to data source is successful', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.getProduct(testId))
      .thenAnswer((_) async => testProductModel);

      //act
      final result = await productRepositoryImpl.getProduct(testId);

      //assert
      expect(result, equals(Right(testProductEntity)));

        }
      );

    test(
    'Should return server failure when a call to data source is unsuccessful.', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.getProduct(testId))
      .thenThrow(ServerException());

      //act
      final result = await productRepositoryImpl.getProduct(testId);

      //assert
      expect(result, equals(Left(ServerFailure('An error has occurred'))));

        }
      );

    test(
    'Should return connection failure when the device has no internet', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.getProduct(testId))
      .thenThrow(const SocketException('Failed to connect to the network'));

      //act
      final result = await productRepositoryImpl.getProduct(testId);

      //assert
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));

        }
      );
    }
  );



    group('get all products', () {
    test(
    'Should List of products when a call to data source is successful', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.getAllProducts())
      .thenAnswer((_) async => listOfProductModel);

      //act
      final result = await productRepositoryImpl.getAllProducts();

      //assert
      result.fold((left) => expect(left, listOfProduct), (right) => expect(right, listOfProduct));


        }
      );

    test(
    'Should return server failure when a call to data source is unsuccessful.', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.getAllProducts())
      .thenThrow(ServerException());

      //act
      final result = await productRepositoryImpl.getAllProducts();

      //assert
      expect(result, equals(Left(ServerFailure('An error has occurred'))));

        }
      );

    test(
    'Should return connection failure when the device has no internet', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.getAllProducts())
      .thenThrow(const SocketException('Failed to connect to the network'));

      //act
      final result = await productRepositoryImpl.getAllProducts();

      //assert
      expect(result, equals(Left(ConnectionFailure('Failed to connect to the network'))));

        }
      );
    }
  );


  group('delete Product', (){
  test(
    'Should delete product when a call to data source is successful', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(testId))
      .thenAnswer((_) async => 'product successfully deleted');

      //act
      final result = await productRepositoryImpl.deleteProduct(testId);

      //assert
      expect(result, equals(Right('product successfully deleted')));

        }
      );

    test(
    'Should return server failure when a call to data source is unsuccessful.', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.deleteProduct(testId))
      .thenThrow(ServerException());

      //act
      final result = await productRepositoryImpl.deleteProduct(testId);

      //assert
      expect(result, equals(Left(ServerFailure('An error has occurred'))));

        }
      );

});


  group('update Product', (){
  test(
    'Should update product when a call to data source is successful', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.updateProduct(testProductModel.id, testProductModel.name, testProductModel.description, testProductModel.price))
      .thenAnswer((_) async => testProductModel);

      //act
      final result = await productRepositoryImpl.updateProduct(testProductModel.id, testProductModel.name, testProductModel.description, testProductModel.price);

      //assert
      expect(result, equals(Right(testProductEntity)));

        }
      );

    test(
    'Should return server failure when a call to data source is unsuccessful.', 
    () async{
      //arrange
      when(mockProductRemoteDataSource.updateProduct(testProductModel.id, testProductModel.name, testProductModel.description, testProductModel.price))
      .thenThrow(ServerException());

      //act
      final result = await productRepositoryImpl.updateProduct(testProductModel.id, testProductModel.name, testProductModel.description, testProductModel.price);

      //assert
      expect(result, equals(Left(ServerFailure('An error has occurred'))));

        }
      );

});

}