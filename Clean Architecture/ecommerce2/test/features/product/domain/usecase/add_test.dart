import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:ecommerce2/features/product/domain/usecase/add.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  ProductEntity product = ProductEntity(id: '1', name: 'name1', price: 1, imageUrl: 'image1', description: 'description1');
  
  late AddProductUseCase addProductUseCase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    addProductUseCase = AddProductUseCase(mockProductRepository);
    
  });

  test(
   "should add product to repository" , 
   ()async{
    //arrange
    when(
      mockProductRepository.addProduct(product)
    ).thenAnswer((_) async => Right(product));

    //act 
    final result = await addProductUseCase.execute(product);

    //assert
    expect(result, Right(product));
   }
  );
}