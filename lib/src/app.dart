import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/shared/feedback_service.dart';
import 'package:todo_app/src/widgets/bottom_bar/bottom_bar.dart';
import 'package:todo_app/src/widgets/item/item.dart';
import 'shared/constants.dart';
import 'widgets/custom_app_bar/custom_app_bar.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // Flags -------------------------------------------------------------
  int? _reorderingItemIndex;

  // Hive --------------------------------------------------------------
  late Box<TodoModel> _todosBox;

  // Controllers -------------------------------------------------------
  final ScrollController _scrollController = ScrollController();

  // Lifecycle ---------------------------------------------------------
  @override
  void initState() {
    super.initState();
    _todosBox = Hive.box<TodoModel>(todosBoxName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 239, 239),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // App Bar ------------------------------------------------------
            ValueListenableBuilder(
              valueListenable: _todosBox.listenable(),
              builder: (context, value, child) {
                return CustomAppBar(
                    todosCount: _todosBox.length,
                    completedTodosCount:
                        _todosBox.values.where((todo) => todo.isDone).length,
                    onClearAll: _clearAll);
              },
            ),

            // Body ---------------------------------------------------------
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ValueListenableBuilder(
                    valueListenable: _todosBox.listenable(),
                    builder: (context, Box<TodoModel> box, _) {
                      return box.isNotEmpty
                          ? ReorderableListView.builder(
                              padding: const EdgeInsets.all(10),
                              scrollController: _scrollController,
                              itemCount: box.length,
                              onReorder: _reorderTodos,
                              onReorderStart: _reorderStart,
                              onReorderEnd: _reorderEnd,
                              itemBuilder: (context, index) {
                                final currentTodo = box.getAt(index);
                                return Item(
                                    key: Key('$index'),
                                    title: currentTodo?.title ?? '',
                                    isDone: currentTodo?.isDone ?? false,
                                    onChanged: (status) => _updateTodoStatus(
                                        index: index, isDone: status!),
                                    onDelete: () => _deleteTodo(index));
                              },
                              proxyDecorator: (_, index, animation) {
                                final currentTodo = box.getAt(index);
                                final isReordering =
                                    _reorderingItemIndex == index;
                                return Item(
                                    title: currentTodo?.title ?? '',
                                    isDone: currentTodo?.isDone ?? false,
                                    isReordering: isReordering,
                                    onChanged: (status) => _updateTodoStatus(
                                        index: index, isDone: status!),
                                    onDelete: () => _deleteTodo(index));
                              },
                            )
                          : Center(
                              child: Lottie.asset(
                                  'assets/lottie/empty_list.json',
                                  fit: BoxFit.cover,
                                  repeat: false),
                            );
                    },
                  )),
            ),

            // Bottom Bar ------------------------------------------------------
            BottomBar(onAddTodo: _addTodo),
          ],
        ),
      ),
    );
  }

  // Handlers ----------------------------------------------------------
  void _clearAll() async {
    await _todosBox.clear();
    FeedbackService.deleting();
  }

  void _addTodo(String todoName) async {
    await _todosBox.add(TodoModel(title: todoName));
    _scrollToBottom();
    FeedbackService.adding();
  }

  void _updateTodoStatus({required int index, required bool isDone}) async {
    final todoToUpdate = _todosBox.getAt(index);
    if (todoToUpdate != null) {
      todoToUpdate.isDone = isDone;
      await _todosBox.putAt(index, todoToUpdate);
    }
    FeedbackService.adding();
  }

  void _deleteTodo(int index) async {
    await _todosBox.deleteAt(index);
    FeedbackService.deleting();
  }

  void _reorderTodos(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }

    final List<TodoModel> todos = _todosBox.values.toList();
    final TodoModel todoToReplace = todos.removeAt(oldIndex);
    todos.insert(newIndex, todoToReplace);

    await _todosBox.clear();
    await _todosBox.addAll(todos);
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
      Future.delayed(const Duration(microseconds: 700), () {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });
    });
  }
}
