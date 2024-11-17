part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

class HomeInitial extends HomeState {
  HomeInitial();

  @override
  List<Object?> get props => [];
}


class AddTaskState extends HomeState {
  AddTaskState();
  
  @override
  List<Object?> get props => [];
  
}