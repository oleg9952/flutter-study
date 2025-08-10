import 'task.dart';

class Category {
  final String id;
  final String name;
  final List<Task> tasks;

  /// ARGB color value for the category card background
  final int? colorValue;

  const Category({
    required this.id,
    required this.name,
    this.tasks = const [],
    this.colorValue,
  });

  bool get isCompleted => tasks.isNotEmpty && tasks.every((t) => t.isCompleted);

  Category copyWith(
      {String? id, String? name, List<Task>? tasks, int? colorValue}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      tasks: tasks ?? this.tasks,
      colorValue: colorValue ?? this.colorValue,
    );
  }
}
