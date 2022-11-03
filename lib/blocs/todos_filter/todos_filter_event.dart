part of 'todos_filter_bloc.dart';

abstract class TodosFilterEvent extends Equatable {
  const TodosFilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateTodos extends TodosFilterEvent {
  final TodosFilter todosFilter;

   const UpdateTodos({this.todosFilter = TodosFilter.all});

  @override
  List<Object> get props => [todosFilter];
}

class UpdateFilter extends TodosFilterEvent {

  const UpdateFilter();

  @override
  List<Object> get props => [];
}


