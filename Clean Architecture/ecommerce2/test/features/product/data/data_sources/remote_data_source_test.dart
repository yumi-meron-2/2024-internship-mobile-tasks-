import 'dart:convert';

import 'package:ecommerce2/features/product/core/constants/constants.dart';
import 'package:ecommerce2/features/product/core/error/exceptions.dart';
import 'package:ecommerce2/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce2/features/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../helpers/json_reader.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  final testProduct = ProductModel(id: "6672752cbd218790438efdb0", name: "Anime website", price: 123, imageUrl: "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg", description: "Explore anime characters.");
  final errorMessage = 'An unknown server error occured';
  var myJson = json.decode(readJson('features/product/helpers/dummy_data/dummy_product_response.json'))['data'] as List<dynamic>;
  var listOfProduct = myJson.map((model) => ProductModel.fromJson(model)).toList() as List<ProductModel>;
  
  

  late MockHttpClient mockHttpClient;
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;

  setUp((){
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl = ProductRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get a product' ,(){
    test('should return product model when the reponse code is 200',() async {
    //arrange
    when(mockHttpClient.get(
      Uri.parse(Urls.baseUrl)
    )).thenAnswer(
      (_)async => http.Response(
        readJson('features/product/helpers/dummy_data/dummy_single_product_response.json'),
        200
      )
    );
    //act
    final result = await productRemoteDataSourceImpl.getProduct(testProduct.id);
    // print(result);
    //assert
    expect(result, testProduct);
    
    });

    test('should throw a server exception when the response code is 404 or other',() async {
    //arrange
    when(mockHttpClient.get(
      Uri.parse(Urls.baseUrl)
    )).thenAnswer(
      (_)async => http.Response(
        'Not found',
         404
      ),
    );
    //act
    final result = productRemoteDataSourceImpl.getProduct;
    // print(result);
    //assert
    expect(() async => await result(testProduct.id), throwsA(isA<ServerException>()));
    
    });

   });



    group('get all products' ,(){
    test('should return product list when the reponse code is 200',() async {
    //arrange
    when(mockHttpClient.get(
      Uri.parse(Urls.baseUrl)
    )).thenAnswer(
      (_)async => http.Response(
        readJson('features/product/helpers/dummy_data/dummy_product_response.json'),
        200
      )
    );
    //act
    final result = await productRemoteDataSourceImpl.getAllProducts();
    print(result);
    //assert
    expect(result, listOfProduct);
    
    });

    test('should throw a server exception when the response code is 404 or other',() async {
    //arrange
    when(mockHttpClient.get(
      Uri.parse(Urls.baseUrl)
    )).thenAnswer(
      (_)async => http.Response(
        'Not found',
         404
      ),
    );
    //act
    final result = productRemoteDataSourceImpl.getAllProducts;
    // print(result);
    //assert
    expect(() async => await result(), throwsA(isA<ServerException>()));
    
    });

   });

   group('Add Product',(){ 
    test(
      'should return a success text when response code is 201', ()async{
      //arrange
      when(mockHttpClient.post(
        Uri.parse(Urls.baseUrl),
        body: json.encode(testProduct.toJson()),
      )).thenAnswer(
        (_) async => http.Response(readJson('features/product/helpers/dummy_data/dummy_single_product_response.json'),
        201
        ),        
      );
      //act
      final result = await productRemoteDataSourceImpl.addProduct(testProduct);

      // assert
      expect(result, testProduct);
    });

    
    test('should throw a server exception when the response code is 404 or other',() async {
    //arrange
    when(mockHttpClient.post(
      Uri.parse(Urls.baseUrl),
      body: json.encode(testProduct.toJson()),
    )).thenAnswer(
      (_)async => http.Response(
        'Not found',
         404
      ),
    );
    //act
    final result = productRemoteDataSourceImpl.addProduct;
    
    //assert
    expect(() async => await result(testProduct), throwsA(isA<ServerException>()));
    
    });

});

group('Delete a product' ,(){
    test('should return a success message when the reponse code is 200',() async {
    //arrange
    when(mockHttpClient.delete(
      Uri.parse("${Urls.baseUrl}/${testProduct.id}")
    )).thenAnswer(
      (_)async => http.Response(
        'product successfully deleted',
        200
      )
    );
    //act
    final result = await productRemoteDataSourceImpl.deleteProduct(testProduct.id);
    // print(result);

    //assert
    var testResponse = 'product successfully deleted';
    expect(result, testResponse);
    
    });

    test('should throw a server exception when the response code is 404 or other',() async {
    //arrange
    when(mockHttpClient.delete(
      Uri.parse("${Urls.baseUrl}/${testProduct.id}")
    )).thenAnswer(
      (_)async => http.Response(
        'Not found',
         404
      ),
    );
    //act
    final result = productRemoteDataSourceImpl.deleteProduct;
    // print(result);
    //assert
    expect(() async => await result(testProduct.id), throwsA(isA<ServerException>()));
    
    });

   });



   
group('Update a product' ,(){
    test('should return updated product  when the reponse code is 200',() async {
    //arrange
    when(mockHttpClient.put(
      Uri.parse("${Urls.baseUrl}/${testProduct.id}"),
      body: '''{\r\n "name" : name, \r\n "description" : description , \r\n "Price" : price}'''
    )).thenAnswer(
      (_)async => http.Response(
        readJson('features/product/helpers/dummy_data/dummy_single_product_response.json'),
        200
      )
    );
    //act
    final result = await productRemoteDataSourceImpl.updateProduct(testProduct.id, testProduct.name, testProduct.description, testProduct.price);
    // print(result);

    //assert
    
    expect(result, testProduct);
    
    });

    test('should throw a server exception when the response code is 404 or other',() async {
    //arrange
    when(mockHttpClient.put(
      Uri.parse("${Urls.baseUrl}/${testProduct.id}"),
      body: '''{\r\n "name" : name, \r\n "description" : description , \r\n "Price" : price}'''
    )).thenAnswer(
      (_)async => http.Response(
        'Not found',
         404
      ),
    );
    //act
    final result = productRemoteDataSourceImpl.updateProduct;
    // print(result);
    //assert
    expect(() async => await result(testProduct.id, testProduct.name, testProduct.description, testProduct.price), throwsA(isA<ServerException>()));
    
    });

   });





}