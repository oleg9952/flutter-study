import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_6/models/category.dart';
import 'package:project_6/models/task.dart';
import 'package:project_6/state/category_store.dart';

Future<void> showEditCategorySheet(BuildContext context, Category category) {
  return showModalBottomSheet<void>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    builder: (ctx) => _EditCategorySheet(category: category),
  );
}

class _EditCategorySheet extends StatefulWidget {
  final Category category;
  const _EditCategorySheet({required this.category});

  @override
  State<_EditCategorySheet> createState() => _EditCategorySheetState();
}

class _EditCategorySheetState extends State<_EditCategorySheet> {
  late TextEditingController _nameController;
  late List<TextEditingController> _taskControllers;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
    _taskControllers = [
      for (final t in widget.category.tasks)
        TextEditingController(text: t.title),
    ];
    if (_taskControllers.isEmpty) {
      _taskControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (final c in _taskControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _addTaskField() {
    setState(() => _taskControllers.add(TextEditingController()));
  }

  void _removeTaskField(int index) {
    setState(() {
      final controller = _taskControllers.removeAt(index);
      controller.dispose();
    });
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;

    final String name = _nameController.text.trim();
    final List<String> titles = _taskControllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    final List<Task> existing = widget.category.tasks;
    final List<Task> tasks = <Task>[];
    for (int i = 0; i < titles.length; i++) {
      if (i < existing.length) {
        tasks.add(existing[i].copyWith(title: titles[i]));
      } else {
        tasks.add(Task(
          id: '${widget.category.id}_$i',
          title: titles[i],
          isCompleted: false,
        ));
      }
    }

    final updated = widget.category.copyWith(name: name, tasks: tasks);
    context.read<CategoryStore>().updateCategory(updated);
    Navigator.of(context).pop();
  }

  void _delete() {
    context.read<CategoryStore>().deleteCategory(widget.category.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewInsets;
    return Padding(
      padding: EdgeInsets.only(bottom: padding.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Category',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Category name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                  ),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Please enter a name'
                      : null,
                ),
                const SizedBox(height: 16),
                Text(
                  'Tasks',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 8),
                for (int i = 0; i < _taskControllers.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _taskControllers[i],
                            decoration: const InputDecoration(
                              hintText: 'Task title',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          tooltip: 'Remove',
                          onPressed: _taskControllers.length > 1
                              ? () => _removeTaskField(i)
                              : null,
                          icon: const Icon(Icons.remove_circle_outline),
                        ),
                      ],
                    ),
                  ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _addTaskField,
                    icon: const Icon(Icons.add),
                    label: const Text('Add task'),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _save,
                        icon: const Icon(Icons.save_outlined),
                        label: const Text('Save'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton.icon(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Theme.of(context).colorScheme.error,
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.error),
                        ),
                        onPressed: _delete,
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Delete'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
