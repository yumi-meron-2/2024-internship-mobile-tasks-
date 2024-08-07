import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository{
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  
  Future<Either<Failure, void>>addProduct(ProductEntity product);

  Future<Either<Failure, ProductEntity>>deleteProduct(String id);

  Future<Either<Failure, ProductEntity>>getProduct(String id);

  Future<Either<Failure, ProductEntity>>updateProduct(ProductEntity product);
}