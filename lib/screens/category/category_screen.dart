import 'package:flutter/material.dart';
import 'package:project_6/components/category/task_section.dart';

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
  late List<TaskItemData> todo;
  late List<TaskItemData> done;

  @override
  void initState() {
    super.initState();
    // mock data for UI demo
    todo = [
      const TaskItemData(
          id: 't1', title: 'Prepare presentation slides', isCompleted: false),
      const TaskItemData(
          id: 't2', title: 'Schedule team meeting', isCompleted: false),
      const TaskItemData(
          id: 't3', title: 'Review project proposal', isCompleted: false),
      const TaskItemData(
          id: 't4', title: 'Update project documentation', isCompleted: false),
      const TaskItemData(
          id: 't5', title: 'Organize files and folders', isCompleted: false),
      const TaskItemData(
          id: 't6', title: 'Plan next sprint tasks', isCompleted: false),
      const TaskItemData(
          id: 't7', title: 'Check in with design team', isCompleted: false),
      const TaskItemData(
          id: 't8',
          title: 'Test new feature implementation',
          isCompleted: false),
    ];
    done = [
      const TaskItemData(
          id: 'd1', title: 'Send follow-up emails', isCompleted: true),
      const TaskItemData(
          id: 'd2', title: 'Submit weekly report', isCompleted: true),
    ];
  }

  void _toggleInTodo(int index) {
    setState(() {
      final item = todo.removeAt(index);
      done.insert(
          0, TaskItemData(id: item.id, title: item.title, isCompleted: true));
    });
  }

  void _toggleInDone(int index) {
    setState(() {
      final item = done.removeAt(index);
      todo.insert(
          0, TaskItemData(id: item.id, title: item.title, isCompleted: false));
    });
  }

  void _reorderTodo(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = todo.removeAt(oldIndex);
      todo.insert(newIndex, item);
    });
  }

  void _reorderDone(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = done.removeAt(oldIndex);
      done.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.args?.categoryName ?? 'Category';
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
                    tasks: todo,
                    onReorder: _reorderTodo,
                    onToggleIndex: _toggleInTodo,
                  ),
                  TaskSection(
                    title: 'Completed',
                    tasks: done,
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
