import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:ecommerce2/features/product/domain/usecase/get_all_products.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main(){
  List<ProductEntity> testProducts = [
    ProductEntity(id: '1', name: 'shoe1', price: 1, imageUrl: 'image1', description: 'description1'),
    ProductEntity(id: '2', name: 'shoe2', price: 2, imageUrl: 'image2', description: 'description2'),

  ];
  late GetAllProductsUseCase getAllProductsUseCase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    getAllProductsUseCase = GetAllProductsUseCase(mockProductRepository);
  });

  

  test(
    'Should get List of Products from the repository',
    ()async{
      //arrange 
      when(
        mockProductRepository.getAllProducts()
      ).thenAnswer((_) async => Right(testProducts));

      //act
      final result = await getAllProductsUseCase.execute();

      //assert
      expect(result, Right(testProducts));

    }
  );
  

}