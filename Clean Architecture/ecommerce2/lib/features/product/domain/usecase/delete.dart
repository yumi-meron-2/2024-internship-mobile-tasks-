import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';


class DeleteProductUseCase{
  final id = '1';
  final ProductRepository productRepository;
  DeleteProductUseCase(this.productRepository);

  Future<Either<Failure, String>> execute(String id){
    return productRepository.deleteProduct(id);
  }
}