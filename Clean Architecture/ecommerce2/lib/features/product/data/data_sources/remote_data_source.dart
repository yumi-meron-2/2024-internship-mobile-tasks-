import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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
    print(response.statusCode);
    if (response.statusCode == 200){
      // print(response.body);
      var myJson = json.decode(response.body)['data'] as List<dynamic>;
      print(myJson);
      var listOfProduct = myJson.map((model) => ProductModel.fromJson(model)).toList() as List<ProductModel>;
  
      return listOfProduct;

    }else{
      throw ServerException();
    }
  
  }
  
  @override
  Future<ProductModel> addProduct(ProductModel productModel) async {
    var request = http.MultipartRequest('POST', Uri.parse(Urls.baseUrl));
    request.fields['name'] = productModel.name!;
    request.fields['description'] = productModel.description!;
    request.fields['price'] = productModel.price.toString()!;
    var imageFile = File(productModel.imageUrl);
    if (imageFile != null){
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path, 
      contentType: MediaType('image', 'jpg')) );
    final streamedResponse = await client.send(request);
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 201){
      return ProductModel.fromJson(json.decode(response.body)['data']);
    }else{
      throw ServerException();
    } 
    }
    throw Error();
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
    var request =  http.Request('PUT', Uri.parse("${Urls.baseUrl}/$id"));
    request.headers.addAll({
      'Content-Type' : 'application/json',
    });
    request.body = jsonEncode({"name" : name,  "description" : description ,  "price" : price});

    http.StreamedResponse streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

   
   
    // print(response.statusCode);
    print(response.reasonPhrase);
    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body)['data']);
    }
    else{
      throw ServerException();
    }
  }
}

