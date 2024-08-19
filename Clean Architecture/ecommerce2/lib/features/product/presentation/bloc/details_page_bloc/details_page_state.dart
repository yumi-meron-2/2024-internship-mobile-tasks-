part of 'details_page_bloc.dart';

sealed class DetailsPageState extends Equatable {
  const DetailsPageState();
  
  @override
  List<Object> get props => [];
}

final class DetailsPageInitial extends DetailsPageState {}
final class LoadingState extends DetailsPageState{}
final class DeleteSuccessState extends DetailsPageState{}
final class FailureState extends DetailsPageState{
  final String message;
  FailureState(this.message);
}

