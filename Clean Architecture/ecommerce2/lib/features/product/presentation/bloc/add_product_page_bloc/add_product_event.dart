part of 'add_product_bloc.dart';

class AddProductEvent extends Equatable {
  final ProductEntity product;
  const AddProductEvent({required this.product});

  @override
  List<Object> get props => [];
}
