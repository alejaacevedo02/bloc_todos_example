import 'package:bloc_example_demo/blocs/todos_filter/todos_filter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/todos/todos_bloc.dart';
import 'models/todos_model.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodosBloc()
              ..add(LoadTodos(todos: [
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
              ])),
          ),
          BlocProvider(
              create: (context) => TodosFilterBloc(
                  todosBloc: BlocProvider.of<TodosBloc>(context)))
        ],
        child: MaterialApp(
          title: 'BLoC pattern - Todos demo',
          theme: ThemeData(
              // This is the theme of your application.
              //
              // Try running your application with "flutter run". You'll see the
              // application has a blue toolbar. Then, without quitting the app, try
              // changing the primarySwatch below to Colors.green and then invoke
              // "hot reload" (press "r" in the console where you ran "flutter run",
              // or simply save your changes to "hot reload" in a Flutter IDE).
              // Notice that the counter didn't reset back to zero; the application
              // is not restarted.
              primarySwatch: Colors.blue,
              primaryColor: const Color(0xFF000A1F),
              appBarTheme: const AppBarTheme(color: Color(0xFF000A1F))),
          home: const HomeScreen(),
        ));
  }
}
