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
        readJson('features/product/helpers/dummy_data/dummy_product_response.json'),
        200
      )
    );
    //act
    final result = await productRemoteDataSourceImpl.getProduct(testProduct.id);
    
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
    print(result);
    //assert
    expect(() async => await result(testProduct.id), throwsA(isA<ServerException>()));
    
    });

   });
}