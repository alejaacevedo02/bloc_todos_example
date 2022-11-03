import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final String description;
  bool? isCompleted;
  bool? isCancelled;

  Todo(
      {required this.id,
      required this.task,
      required this.description,
      this.isCancelled,
      this.isCompleted}) {
    isCancelled = isCancelled ?? false;
    isCompleted = isCompleted ?? false;
  }

  Todo copyWith({
    String? id,
    String? task,
    String? description,
    bool? isCompleted,
    bool? isCancelled,
  }) {
    return Todo(
        id: id ?? this.id,
        task: task ?? this.task,
        description: description ?? this.description,
        isCancelled: isCancelled ?? this.isCancelled,
        isCompleted: isCompleted ?? this.isCompleted);
  }

  @override
  List<Object?> get props => [
    id,
    task,
    description,
    isCompleted,
    isCancelled,
  ];

  static List<Todo> todos = [
    Todo(
      id: '1',
      task: 'BloC Pattern Video',
      description: 'Explain what is the BloC Pattern',
    ),
    Todo(
      id: '2',
      task: 'BloC Pattern Video #2',
      description: 'Explain what is the BloC Pattern',
    ),
  ];


}
