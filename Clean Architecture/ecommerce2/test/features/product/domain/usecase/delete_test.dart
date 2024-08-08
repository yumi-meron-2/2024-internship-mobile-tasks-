import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:ecommerce2/features/product/domain/usecase/delete.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  ProductEntity product = ProductEntity(id: '1',  name: 'name1', price: 1, imageUrl: 'image1', description: 'description1');

  late DeleteProductUseCase deleteProductUseCase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    deleteProductUseCase = DeleteProductUseCase(mockProductRepository);
  });

  test(
    "should delete a product and return the deleted product",
    ()async{
      //arrange
      when(
        mockProductRepository.deleteProduct(product.id)
      ).thenAnswer((_) async => Right(product));
    
      //act
      final result = await deleteProductUseCase.execute(product.id);

      //assert
      expect(result, Right(product));
    }
    );

}