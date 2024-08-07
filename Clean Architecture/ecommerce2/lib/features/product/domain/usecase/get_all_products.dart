import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../repositories/product_repository.dart';
import 'package:ecommerce2/features/product/domain/entities/product.dart';



class GetAllProductsUseCase{
  final ProductRepository productRepository;

  GetAllProductsUseCase(this.productRepository);

  Future<Either<Failure, List<ProductEntity>>> execute(){
    return productRepository.getAllProducts();
  }
}