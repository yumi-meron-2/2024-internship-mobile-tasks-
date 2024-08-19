part of 'get_all_products_bloc.dart';

// enum home_state{loading, loaded, failure}

class GetAllProductsState extends Equatable {

  GetAllProductsState();
  
  @override
  List<Object> get props => [];
}
final class HomePageInitial extends GetAllProductsState{}
final class HomeLoadingState extends GetAllProductsState{}

final class HomeLoadedState extends GetAllProductsState{

  final List<ProductEntity> products;
  HomeLoadedState({required this.products});
}
final class HomeFailureState extends GetAllProductsState{
  final String message;
  HomeFailureState(this.message);
}
