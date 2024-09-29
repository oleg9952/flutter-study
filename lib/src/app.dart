import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/shared/feedback_service.dart';
import 'package:todo_app/src/widgets/bottom_bar/bottom_bar.dart';
import 'package:todo_app/src/widgets/item/item.dart';
import 'widgets/custom_app_bar/custom_app_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final ScrollController _scrollController = ScrollController();

  final List<TodoModel> _todos = [];
  int? _reorderingItemIndex;

  get _completedTodosCount => _todos.where((todo) => todo.isDone).length;
  get _hasTodos => _todos.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 239, 239),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App Bar
            CustomAppBar(
                todosCount: _todos.length,
                completedTodosCount: _completedTodosCount,
                onClearAll: _clearAll),

            // Body
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: _hasTodos
                      ? ReorderableListView.builder(
                          padding: const EdgeInsets.all(10),
                          scrollController: _scrollController,
                          itemCount: _todos.length,
                          onReorder: _reorderTodos,
                          onReorderStart: _reorderStart,
                          onReorderEnd: _reorderEnd,
                          itemBuilder: (context, index) {
                            final currentTodo = _todos[index];
                            return Item(
                                key: Key('$index'),
                                title: currentTodo.title,
                                isDone: currentTodo.isDone,
                                onChanged: (status) => _updateTodoStatus(
                                    index: index, isDone: status!),
                                onDelete: () => _deleteTodo(index));
                          },
                          proxyDecorator: (child, index, animation) {
                            final currentTodo = _todos[index];
                            final isReordering = _reorderingItemIndex == index;
                            return Item(
                                title: currentTodo.title,
                                isDone: currentTodo.isDone,
                                isReordering: isReordering,
                                onChanged: (status) => _updateTodoStatus(
                                    index: index, isDone: status!),
                                onDelete: () => _deleteTodo(index));
                          },
                        )
                      : Center(
                          child: Lottie.asset('assets/lottie/empty_list.json',
                              fit: BoxFit.cover, repeat: false),
                        )),
            ),

            // Bottom Bar
            BottomBar(onAddTodo: _addTodo),
          ],
        ),
      ),
    );
  }

  void _clearAll() {
    setState(() {
      _todos.clear();
    });
    FeedbackService.deleting();
  }

  void _addTodo(String todoName) {
    setState(() {
      _todos.add(TodoModel(title: todoName));
      _scrollToBottom();
    });
    FeedbackService.adding();
  }

  void _updateTodoStatus({required int index, required bool isDone}) {
    setState(() {
      TodoModel todoToUpdate = _todos[index];
      todoToUpdate.isDone = isDone;
    });
    FeedbackService.adding();
  }

  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
    FeedbackService.deleting();
  }

  void _reorderTodos(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) {
        newIndex--;
      }

      final TodoModel reorderedTodo = _todos.removeAt(oldIndex);
      _todos.insert(newIndex, reorderedTodo);
    });
  }

  void _reorderStart(int index) {
    setState(() {
      _reorderingItemIndex = index;
    });
    FeedbackService.editing();
  }

  void _reorderEnd(int _) {
    setState(() {
      _reorderingItemIndex = null;
    });
    FeedbackService.adding();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(microseconds: 700), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });
  }
}
