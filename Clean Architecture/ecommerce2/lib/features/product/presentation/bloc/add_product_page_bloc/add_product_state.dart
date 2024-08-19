part of 'add_product_bloc.dart';

sealed class AddProductState extends Equatable {
  const AddProductState();
  
  @override
  List<Object> get props => [];
}

final class AddProductInitial extends AddProductState {}
final class AddLoadingState  extends AddProductState{}
final class AddLoadedState extends AddProductState{}
final class AddFailureState extends AddProductState{
  String message;
  AddFailureState({required this.message});
}

