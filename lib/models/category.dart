import 'task.dart';

class Category {
  final String id;
  final String name;
  final List<Task> tasks;

  const Category({
    required this.id,
    required this.name,
    this.tasks = const [],
  });

  bool get isCompleted => tasks.isNotEmpty && tasks.every((t) => t.isCompleted);

  Category copyWith({String? id, String? name, List<Task>? tasks}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
    );
  }
}
