import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'features/product/core/network/network_info.dart';
import 'features/product/data/data_sources/local_data_source.dart';
import 'features/product/data/data_sources/remote_data_source.dart';
import 'features/product/data/repositories/produt_repository_impl.dart';
import 'features/product/domain/repositories/product_repository.dart';
import 'features/product/domain/usecase/add.dart';
import 'features/product/domain/usecase/delete.dart';
import 'features/product/domain/usecase/get_all_products.dart';
import 'features/product/domain/usecase/get_product.dart';
import 'features/product/domain/usecase/update.dart';
final GetIt getIt = GetIt.instance;

Future<void> setup() async {
  var sharedPreferences = await SharedPreferences.getInstance();
  var client = http.Client();
  var connectivity = InternetConnectionChecker();
  getIt.registerLazySingleton(() => connectivity);
  getIt.registerSingleton(sharedPreferences);
  getIt.registerSingleton(client);
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl(getIt()));
  getIt.registerSingleton<LocalDataSource>(LocalDataSourceImpl(sharedPreferences: getIt()));
  getIt.registerSingleton<ProductRemoteDataSource>(ProductRemoteDataSourceImpl(client: getIt()));
  getIt.registerSingleton<ProductRepository>(ProductRepositoryImpl(localDataSource: getIt(), productRemoteDataSource: getIt(),networkInfo: getIt()));
  getIt.registerSingleton<GetAllProductsUseCase>(GetAllProductsUseCase(getIt()));
  getIt.registerSingleton<GetProductUseCase>(GetProductUseCase(getIt()));
  getIt.registerSingleton<DeleteProductUseCase>(DeleteProductUseCase(productRepository: getIt()));
  getIt.registerSingleton<UpdateProductUseCase>(UpdateProductUseCase(productRepository: getIt()));
  getIt.registerSingleton<AddProductUseCase>(AddProductUseCase(getIt()));
}
