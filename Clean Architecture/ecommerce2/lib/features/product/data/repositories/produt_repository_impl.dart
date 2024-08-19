import 'dart:convert';
import 'dart:io';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';
import '../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repository.dart';
import '../data_sources/local_data_source.dart';
import '../data_sources/remote_data_source.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl extends ProductRepository{
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepositoryImpl({ required this.productRemoteDataSource,required this.networkInfo, required this.localDataSource });


  @override
  Future<Either<Failure, ProductEntity>> addProduct(ProductEntity product) async{
    if(await networkInfo.isConnected){
      try{
        final result = await productRemoteDataSource.addProduct(ProductModel.fromEntity(product));

        return Right(result);
      }on ServerException{
        return const Left(ServerFailure('An error has occurred'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect to the network'));
      }
    }else{
      throw Left(NetworkException('No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, String>> deleteProduct(String id) async {
    if(await networkInfo.isConnected){
      try{
        final result = await productRemoteDataSource.deleteProduct(id);

        return Right(result);
      }on ServerException{
        return const Left(ServerFailure('An error has occurred'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect to the network'));
      }
    }else{
      throw Left(NetworkException('No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    if (await networkInfo.isConnected){
      try{
        final result = await productRemoteDataSource.getAllProducts();
      
        var listOfProduct = result.map((model) => (model).toEntity()).toList() as List<ProductEntity>;

        return Right(listOfProduct);

      } on ServerException{
        return const Left(ServerFailure('An error has occurred'));

      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect to the network'));
      }
    }else {
      
       List<ProductModel> productModels = localDataSource.getAllProducts();
       List<ProductEntity> productEntities = productModels.map((productModel) => productModel.toEntity()).toList();
       return Right(productEntities);
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) async { 
    if(await networkInfo.isConnected){  
      try{
        final result = await productRemoteDataSource.getProduct(id);
        return Right(result.toEntity());
      } on ServerException{
        return const Left(ServerFailure('An error has occurred'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect to the network'));
      }
    }else{
      ProductModel product = localDataSource.getProduct(id);
      return Right(product.toEntity());
    }
  }


  @override
  Future<Either<Failure, ProductEntity>> updateProduct(String id, String name, String description,double price) async {
    if(await networkInfo.isConnected){ 
      try{
        final result = await productRemoteDataSource.updateProduct(id, name, description, price);
        return Right(result.toEntity());
      } on ServerException{
        return const Left(ServerFailure('An error has occurred'));
      } on SocketException{
        return const Left(ConnectionFailure('Failed to connect to the network'));
      }
    }else{
      throw Left(NetworkException('No Internet Connection'));
    }
  }}
  
  