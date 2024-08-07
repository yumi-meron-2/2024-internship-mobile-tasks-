import 'package:dartz/dartz.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:ecommerce2/features/product/domain/usecase/get_product.dart';
import '../../helpers/test_helper.mocks.dart';

void main(){
  ProductEntity product = ProductEntity(id: '1', name: 'name1', price: 1, rating: 5, imageUrl: 'image1', description: 'description1');

  late GetProductUseCase getProductUseCase;
  late MockProductRepository mockProductRepository;

  setUp((){
    mockProductRepository = MockProductRepository();
    getProductUseCase = GetProductUseCase(mockProductRepository);

  });
  test(
   "should get product From repository" , 
   ()async{
    //arrange
    when(
      mockProductRepository.getProduct(product.id)
    ).thenAnswer((_) async => Right(product));

    //act 
    final result = await getProductUseCase.execute(product.id);

    //assert
    expect(result, Right(product));
   }
  );

}