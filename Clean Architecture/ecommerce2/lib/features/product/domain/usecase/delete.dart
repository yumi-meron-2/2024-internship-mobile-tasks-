import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/product_repository.dart';


class DeleteProductUseCase{

  final ProductRepository productRepository;
  DeleteProductUseCase({required this.productRepository});

  Future<Either<Failure, String>> execute(String id){
    return productRepository.deleteProduct(id);
  }
}