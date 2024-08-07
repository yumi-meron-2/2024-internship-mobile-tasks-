import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class AddProductUseCase{
  final ProductRepository productRepository;

  AddProductUseCase(this.productRepository);

  Future<Either<Failure, void>> execute(ProductEntity productEntity){
    return productRepository.addProduct(productEntity);
  }
}