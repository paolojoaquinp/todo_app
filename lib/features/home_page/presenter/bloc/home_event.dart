part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}


class AddTaskRequestedEvent extends HomeEvent {}
class CloseAddTaskRequestedEvent extends HomeEvent {}
class CreateTaskRequestedEvent extends HomeEvent {
  final String title;
  final String description;
  final String list;

  const CreateTaskRequestedEvent({
    required this.title,
    required this.description,
    required this.list,
  });

  @override
  List<Object> get props => [title, description, list];
}
