import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecase/update.dart';

part 'update_page_event.dart';
part 'update_page_state.dart';

class UpdatePageBloc extends Bloc<UpdatePageEvent, UpdatePageState> {
  UpdateProductUseCase updateProductUseCase;
  UpdatePageBloc({required this.updateProductUseCase}) : super(UpdatePageInitial()) {
    on<UpdatePageEvent>((event, emit)async {
      emit(UpdatePageLoading());
      var product = await updateProductUseCase.execute(event.product);
      print(product);
      product.fold((l) => emit(UpdateFailureState(message: "Failed to update")), (r) => emit(UpdateSuccessState()));
      
    });
  }
}
