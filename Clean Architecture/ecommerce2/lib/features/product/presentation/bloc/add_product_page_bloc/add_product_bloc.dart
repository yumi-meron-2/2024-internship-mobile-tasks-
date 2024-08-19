import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecase/add.dart';

part 'add_product_event.dart';
part 'add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent, AddProductState> {
  AddProductUseCase addProductUseCase;
  AddProductBloc({required this.addProductUseCase}) : super(AddProductInitial()) {
    on<AddProductEvent>((event, emit) async{
      emit(AddLoadingState());

      var product = await addProductUseCase.execute(event.product);

      product.fold((l) => emit(AddFailureState(message: 'Failed to add product')), (r) => emit(AddLoadedState()));
    });
  }
}
