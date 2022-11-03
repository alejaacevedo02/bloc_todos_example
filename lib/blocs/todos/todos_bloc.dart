import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todos_model.dart';

part 'todos_event.dart';

part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<DeleteTodo>(_onDeleteTodo);
  }

  void _onLoadTodos(LoadTodos event, Emitter<TodosState> emit) {
    emit(TodosLoaded(todos: event.todos));
  }

  void _onAddTodo(AddTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      emit(TodosLoaded(todos: List.from(state.todos)..add(event.todo)));
    }
  }

  void _onUpdateTodo(UpdateTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      // final indexToUpdate =
      //     state.todos.indexWhere((todo) => todo.id == event.todo.id);
      // state.todos[indexToUpdate]
      //     .copyWith(id: event.todo.id, task: event.todo.task);
      List<Todo> updateTodos = (state.todos.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      })).toList();
      emit(TodosLoaded(todos: updateTodos));
    }
  }

  void _onDeleteTodo(DeleteTodo event, Emitter<TodosState> emit) {
    final state = this.state;
    if (state is TodosLoaded) {
      List<Todo> newToDo =
          state.todos.where((todo) => todo.id != event.todo.id).toList();
      emit(TodosLoaded(todos: newToDo));
    }
  }
}
