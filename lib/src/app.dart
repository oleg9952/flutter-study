import 'package:flutter/material.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/widgets/bottom_bar/bottom_bar.dart';
import 'package:todo_app/src/widgets/item/item.dart';
import 'widgets/custom_app_bar/custom_app_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<TodoModel> todos = [];

  get _completedTodosCount => todos.where((todo) => todo.isDone).length;

  void _clearAll() {
    setState(() {
      todos.clear();
    });
  }

  void _addTodo(String todoName) {
    setState(() {
      todos.add(TodoModel(title: todoName));
    });
  }

  void _updateTodoStatus({required int index, required bool isDone}) {
    setState(() {
      TodoModel todoToUpdate = todos[index];
      todoToUpdate.isDone = isDone;
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void _reorderTodos(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex -= 1;
      }

      final TodoModel reorderedTodo = todos.removeAt(oldIndex);
      todos.insert(newIndex, reorderedTodo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 239, 239),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App Bar
            CustomAppBar(
                todosCount: todos.length,
                completedTodosCount: _completedTodosCount,
                onClearAll: _clearAll),

            // Body
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ReorderableListView.builder(
                    padding: const EdgeInsets.all(10),
                    itemCount: todos.length,
                    onReorder: _reorderTodos,
                    itemBuilder: (context, index) {
                      final currentTodo = todos[index];
                      return Item(
                          key: Key(currentTodo.title + index.toString()),
                          title: currentTodo.title,
                          isDone: currentTodo.isDone,
                          onChanged: (status) =>
                              _updateTodoStatus(index: index, isDone: status!),
                          onDelete: () => _deleteTodo(index));
                    }),
              ),
            ),

            // Bottom Bar
            BottomBar(onAddTodo: _addTodo),
          ],
        ),
      ),
    );
  }
}
