import 'package:flutter/material.dart';
import 'task_item.dart';

typedef ReorderCallback = void Function(int oldIndex, int newIndex);

class TaskSection extends StatelessWidget {
  final String title;
  final List<TaskItemData> tasks;
  final ReorderCallback onReorder;
  final ValueChanged<int>? onToggleIndex;

  const TaskSection({
    super.key,
    required this.title,
    required this.tasks,
    required this.onReorder,
    this.onToggleIndex,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      sliver: SliverList.list(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          ReorderableListView.builder(
            primary: false,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            onReorder: onReorder,
            proxyDecorator: (child, index, animation) => PhysicalModel(
              color: Colors.transparent,
              elevation: 8,
              borderRadius: BorderRadius.circular(16),
              clipBehavior: Clip.antiAlias,
              child: child,
            ),
            itemBuilder: (context, index) {
              final t = tasks[index];
              return Padding(
                key: ValueKey(t.id),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TaskItem(
                  id: t.id,
                  title: t.title,
                  isCompleted: t.isCompleted,
                  onToggle: onToggleIndex != null
                      ? (checked) => onToggleIndex!(index)
                      : null,
                ),
              );
            },
            itemCount: tasks.length,
          ),
        ],
      ),
    );
  }
}

class TaskItemData {
  final String id;
  final String title;
  final bool isCompleted;

  const TaskItemData({
    required this.id,
    required this.title,
    required this.isCompleted,
  });
}
