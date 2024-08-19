part of 'update_page_bloc.dart';

sealed class UpdatePageState extends Equatable {
  const UpdatePageState();
  
  @override
  List<Object> get props => [];
}

final class UpdatePageInitial extends UpdatePageState {}
final class UpdatePageLoading extends UpdatePageState{}
final class UpdateSuccessState extends UpdatePageState{}
final class UpdateFailureState extends UpdatePageState{
  String message;
  UpdateFailureState({required this.message});
}

