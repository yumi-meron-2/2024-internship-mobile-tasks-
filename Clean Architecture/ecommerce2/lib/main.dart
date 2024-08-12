import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'features/product/data/data_sources/remote_data_source.dart';

void main() async {
  var myClient = http.Client() ;
  var prods = ProductRemoteDataSourceImpl(client: myClient);

  var products = await prods.getAllProducts();
  print(products);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
