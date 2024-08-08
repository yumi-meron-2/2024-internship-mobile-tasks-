import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/constants/constants.dart';
import '../../core/error/exceptions.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDataSource{
  Future<ProductModel> getProduct(String id);
}

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource{
  final http.Client client;
  ProductRemoteDataSourceImpl({ required this.client});
  
  @override
  Future<ProductModel> getProduct(String id) async{
    final response = await client.get(Uri.parse(Urls.baseUrl));

    if (response.statusCode == 200){
      return ProductModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  
  }
}

