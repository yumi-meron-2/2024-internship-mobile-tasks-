

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product_model.dart';

abstract class LocalDataSource{
  Future<void> cacheProducts(List<ProductModel> products);
  List<ProductModel> getAllProducts();
  ProductModel getProduct(String id);
  
}

class LocalDataSourceImpl implements LocalDataSource{
  var keyName = 'cachedproducts';
  SharedPreferences sharedPreferences;
  LocalDataSourceImpl({required this.sharedPreferences});
  
  @override
  Future<void> cacheProducts(List<ProductModel> products) async {
    var jsonMap = json.encode(products.map((product) => product.toJson()).toList());
    bool response = await sharedPreferences.setString(keyName, jsonMap);
    if (response == false){
      throw Exception('Local error');
    }
  }



  @override
  List<ProductModel> getAllProducts() {
    var response = sharedPreferences.getString(keyName);
    if (response != null){
      List<ProductModel> listOfCachedProducts  = _jsonToProductList(response);
      return listOfCachedProducts;
    }else{
      throw Exception('chached missed');
    }
  }
  
  List<ProductModel> _jsonToProductList(String response){
    var listJson = json.decode(response);

    List<ProductModel> listOfProducts = [];
    for (var prod in listJson){
      listOfProducts.add(ProductModel.fromJson(prod));
    }

    return listOfProducts;
  }
  
  @override
  ProductModel getProduct(String id) {
    var response = sharedPreferences.getString(keyName);
    if (response != null){
      var tempListOfProducts = _jsonToProductList(response);
      for (var prod in tempListOfProducts){
        if (prod.id == id){
          return prod;
        }
      }
      throw Exception('product not found');
    }else{
      throw Exception('error with shared preference');
    }
  }



}