import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecase/get_all_products.dart';

part 'search_page_event.dart';
part 'search_page_state.dart';

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {

  final GetAllProductsUseCase getAllProductsUseCase;

  SearchPageBloc({required this.getAllProductsUseCase}) : super(LoadingState()) {

    on<SearchPageEvent>((event, emit) async {
      emit(LoadingState());

      var products = await getAllProductsUseCase.execute();
      

      emit(products.fold((l) => FailureState(l.message), (r) => SearchLodedState(products: r) ));
    
      
    });
  }
}
