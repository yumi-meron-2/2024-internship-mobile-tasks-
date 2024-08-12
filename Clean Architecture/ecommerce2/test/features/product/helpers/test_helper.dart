import 'package:ecommerce2/features/product/data/data_sources/remote_data_source.dart';
import 'package:ecommerce2/features/product/domain/repositories/product_repository.dart';
import 'package:http/http.dart'as http;
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    ProductRepository,
    ProductRemoteDataSource
  ],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main(){}