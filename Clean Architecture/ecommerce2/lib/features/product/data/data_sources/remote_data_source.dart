import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/constants.dart';
import '../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<ProductModel> getProduct(String id);
  Future<List<ProductModel>> getAllProducts();
  Future<ProductModel> addProduct(ProductModel productModel);
  Future<String> deleteProduct(String id);
  Future<ProductModel> updateProduct(String id, String name, String description, double price);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final http.Client client;
  ProductRemoteDataSourceImpl({ required this.client});
  
  @override
  Future<ProductModel> getProduct(String id) async{
    final response = await client.get(Uri.parse("${Urls.baseUrl}/$id"));

    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body)['data']);
    }else{
      throw ServerException();
    }
  

  }

  @override
  Future<List<ProductModel>> getAllProducts() async{
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200){
      var myJson = json.decode(response.body)['data'] as List<dynamic>;
      print(myJson[0]);
      var listOfProduct = myJson.map((model) => ProductModel.fromJson(model)).toList() as List<ProductModel>;
      
      return listOfProduct;

    }else{
      throw ServerException();
    }
  
  }
  
  @override
  Future<ProductModel> addProduct(ProductModel productModel) async {
    final response = await client.post(Uri.parse(Urls.baseUrl), body: json.encode(productModel.toJson()));

    if (response.statusCode == 201){
      return ProductModel.fromJson(json.decode(response.body)['data']);
    }else{
      throw ServerException();
    } 
  }
  
  @override
  Future<String> deleteProduct(String id) async {
    final response = await client.delete(Uri.parse("${Urls.baseUrl}/$id"));

    if (response.statusCode == 200){
      return 'product successfully deleted';
    }else{
      throw ServerException();
    }
  }
  
  @override
  Future<ProductModel> updateProduct(String id, String name, String description, double price)async {
    final response = await client.put(Uri.parse("${Urls.baseUrl}/$id"), body: '''{\r\n "name" : name, \r\n "description" : description , \r\n "Price" : price}''') ;

    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body)['data']);
    }
    else{
      throw ServerException();
    }
  }
}

