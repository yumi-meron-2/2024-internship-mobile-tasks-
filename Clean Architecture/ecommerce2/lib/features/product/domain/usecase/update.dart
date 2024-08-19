import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';

class UpdateProductUseCase{
  final ProductRepository productRepository;
  UpdateProductUseCase({required this.productRepository});

  Future<Either<Failure, ProductEntity>> execute(ProductEntity product){
    return productRepository.updateProduct(product.id, product.name, product.description, product.price);
  }
}