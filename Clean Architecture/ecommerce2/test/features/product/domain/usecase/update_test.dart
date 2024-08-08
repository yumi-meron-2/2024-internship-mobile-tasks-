import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:ecommerce2/features/product/domain/usecase/update.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  ProductEntity product = ProductEntity(id: '1', name: 'name1', price: 1, imageUrl: 'image1', description: 'description1');

  late UpdateProductUseCase updateProductUseCase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    updateProductUseCase = UpdateProductUseCase(mockProductRepository);
  });

  test(
    'Should update a product and return it',
    ()async{
      //arrange
      when(
        mockProductRepository.updateProduct(product)
        ).thenAnswer((_) async => Right(product));
      
      //act
      final result = await updateProductUseCase.execute(product);

      //asset
      expect(result, Right(product));
    }
  );
}