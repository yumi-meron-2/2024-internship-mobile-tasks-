import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/product.dart';

abstract class ProductRepository{
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  
  Future<Either<Failure, ProductEntity>>addProduct(ProductEntity product);

  Future<Either<Failure, String>>deleteProduct(String id);

  Future<Either<Failure, ProductEntity>>getProduct(String id);

  Future<Either<Failure, ProductEntity>>updateProduct(String id, String name, String description, double price);
}