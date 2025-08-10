import 'package:flutter/material.dart';
import 'package:project_6/models/category.dart';
import 'package:project_6/models/task.dart';

Future<Category?> showAddCategorySheet(BuildContext context) {
  return showModalBottomSheet<Category>(
    context: context,
    useSafeArea: true,
    isScrollControlled: true,
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.surface,
    builder: (ctx) => const _AddCategorySheet(),
  );
}

class _AddCategorySheet extends StatefulWidget {
  const _AddCategorySheet();

  @override
  State<_AddCategorySheet> createState() => _AddCategorySheetState();
}

class _AddCategorySheetState extends State<_AddCategorySheet> {
  final TextEditingController _nameController = TextEditingController();
  final List<TextEditingController> _taskControllers = [
    TextEditingController()
  ];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    final String name = _nameController.text.trim();
    final List<String> titles = _taskControllers
        .map((c) => c.text.trim())
        .where((t) => t.isNotEmpty)
        .toList();

    final String categoryId = DateTime.now().microsecondsSinceEpoch.toString();
    final List<Task> tasks = [
      for (int i = 0; i < titles.length; i++)
        Task(
          id: '${categoryId}_$i',
          title: titles[i],
          isCompleted: false,
        )
    ];

    final category = Category(id: categoryId, name: name, tasks: tasks);
    Navigator.of(context).pop(category);
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
                  'New Category',
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
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  validator: (value) => (value == null || value.trim().isEmpty)
                      ? 'Please enter a name'
                      : null,
                ),
                const SizedBox(height: 16),
                Text(
                  'Tasks',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.w700),
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
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _submit,
                    icon: const Icon(Icons.check),
                    label: const Text('Create'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
