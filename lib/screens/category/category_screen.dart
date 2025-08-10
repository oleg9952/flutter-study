import 'package:flutter/material.dart';
import 'package:project_6/components/category/task_section.dart';
import 'package:provider/provider.dart';
import 'package:project_6/state/category_store.dart';
import 'package:project_6/models/task.dart';

class CategoryScreenArgs {
  final String categoryId;
  final String categoryName;
  const CategoryScreenArgs(
      {required this.categoryId, required this.categoryName});
}

class CategoryScreen extends StatefulWidget {
  final CategoryScreenArgs? args;
  const CategoryScreen({super.key, this.args});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _toggleInTodo(int index) {
    final store = context.read<CategoryStore>();
    final categoryId = widget.args!.categoryId;
    final category = store.getById(categoryId);
    if (category == null) return;
    final t = category.tasks.where((t) => !t.isCompleted).toList()[index];
    store.toggleTask(categoryId: categoryId, taskId: t.id, isCompleted: true);
  }

  void _toggleInDone(int index) {
    final store = context.read<CategoryStore>();
    final categoryId = widget.args!.categoryId;
    final category = store.getById(categoryId);
    if (category == null) return;
    final t = category.tasks.where((t) => t.isCompleted).toList()[index];
    store.toggleTask(categoryId: categoryId, taskId: t.id, isCompleted: false);
  }

  void _reorderTodo(int oldIndex, int newIndex) {
    final store = context.read<CategoryStore>();
    final categoryId = widget.args!.categoryId;
    final category = store.getById(categoryId);
    if (category == null) return;
    final todos = category.tasks.where((t) => !t.isCompleted).toList();
    if (newIndex > oldIndex) newIndex -= 1;
    final item = todos.removeAt(oldIndex);
    todos.insert(newIndex, item);
    final dones = category.tasks.where((t) => t.isCompleted).toList();
    final newOrder = <Task>[...todos, ...dones];
    store.reorderCategoryTasks(categoryId: categoryId, newOrder: newOrder);
  }

  void _reorderDone(int oldIndex, int newIndex) {
    final store = context.read<CategoryStore>();
    final categoryId = widget.args!.categoryId;
    final category = store.getById(categoryId);
    if (category == null) return;
    final dones = category.tasks.where((t) => t.isCompleted).toList();
    if (newIndex > oldIndex) newIndex -= 1;
    final item = dones.removeAt(oldIndex);
    dones.insert(newIndex, item);
    final todos = category.tasks.where((t) => !t.isCompleted).toList();
    final newOrder = <Task>[...todos, ...dones];
    store.reorderCategoryTasks(categoryId: categoryId, newOrder: newOrder);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.args?.categoryName ?? 'Category';
    final store = context.watch<CategoryStore>();
    final category =
        widget.args == null ? null : store.getById(widget.args!.categoryId);
    final tasks = category?.tasks ?? const <Task>[];
    final todos = tasks.where((t) => !t.isCompleted).toList();
    final dones = tasks.where((t) => t.isCompleted).toList();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Container(
              color: Theme.of(context).colorScheme.surfaceContainerLowest,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    automaticallyImplyLeading: true,
                    backgroundColor:
                        Theme.of(context).colorScheme.surfaceContainerLowest,
                    surfaceTintColor: Colors.transparent,
                    elevation: 0,
                    scrolledUnderElevation: 0,
                    title: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                    ),
                  ),
                  TaskSection(
                    title: 'To Do',
                    tasks: [
                      for (final t in todos)
                        TaskItemData(
                            id: t.id,
                            title: t.title,
                            isCompleted: t.isCompleted),
                    ],
                    onReorder: _reorderTodo,
                    onToggleIndex: _toggleInTodo,
                  ),
                  TaskSection(
                    title: 'Completed',
                    tasks: [
                      for (final t in dones)
                        TaskItemData(
                            id: t.id,
                            title: t.title,
                            isCompleted: t.isCompleted),
                    ],
                    onReorder: _reorderDone,
                    onToggleIndex: _toggleInDone,
                  ),
                  const SliverToBoxAdapter(child: SizedBox(height: 32)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
