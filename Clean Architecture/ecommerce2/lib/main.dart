import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce2/features/product/presentation/bloc/add_product_page_bloc/add_product_bloc.dart';
import 'features/product/presentation/bloc/add_product_page_bloc/add_product_bloc.dart';
import 'features/product/presentation/bloc/details_page_bloc/details_page_bloc.dart';
import 'features/product/presentation/bloc/home/get_all_products_bloc.dart';
import 'features/product/presentation/bloc/update_page_bloc/update_page_bloc.dart';
import 'features/product/presentation/pages/home_page/home_page.dart';
import 'service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider( providers: [
      BlocProvider(
      create: (context) => DetailsPageBloc(deleteProductUseCase: getIt()),
    ),
    BlocProvider(
      create: (context) => GetAllProductsBloc(getAllProductsUseCase: getIt())..add(GetAllProductsEvent()),
    ),
    BlocProvider(
      create: (context) => UpdatePageBloc(updateProductUseCase: getIt())),
     
    BlocProvider(
      create:(context) => AddProductBloc(addProductUseCase: getIt()) ),
    ],
    child: MaterialApp(home: HomePage()),
    );
  }
}
