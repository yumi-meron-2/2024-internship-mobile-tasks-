part of 'search_page_bloc.dart';

sealed class SearchPageState extends Equatable {
  const SearchPageState();
  
  @override
  List<Object> get props => [];
}

// final class SearchPageBlocInitial extends SearchPageBlocState {}
final class LoadingState extends SearchPageState{}
final class SearchLodedState extends SearchPageState{
   final List<ProductEntity> products;
  SearchLodedState({required this.products});
}
final class FailureState extends SearchPageState{
  final String message;
  FailureState(this.message);
}