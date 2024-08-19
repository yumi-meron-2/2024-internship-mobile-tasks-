import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/usecase/delete.dart';
import '../../../domain/usecase/get_product.dart';

part 'details_page_event.dart';
part 'details_page_state.dart';

class DetailsPageBloc extends Bloc<DetailsPageEvent, DetailsPageState> {
  DeleteProductUseCase deleteProductUseCase;
  DetailsPageBloc({required this.deleteProductUseCase}) : super(DetailsPageInitial()) {
    on<DetailsPageEvent>((event, emit) async{
      emit(LoadingState());
      var product = await deleteProductUseCase.execute(event.id);
      product.fold((l) => emit(FailureState(l.message)), (r) => emit(DeleteSuccessState()));
      
   
  });

  }
    }
  
