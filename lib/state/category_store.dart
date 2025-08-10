import 'dart:collection';

import 'package:flutter/foundation.dart' show ChangeNotifier;

import '../models/category.dart';
import '../models/task.dart';

class CategoryStore extends ChangeNotifier {
  final List<Category> _categories = <Category>[];

  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_categories);

  Category? getById(String id) {
    for (final c in _categories) {
      if (c.id == id) return c;
    }
    return null;
  }

  void addCategory(Category category) {
    _categories.add(category);
    notifyListeners();
  }

  void updateCategory(Category category) {
    final index = _categories.indexWhere((c) => c.id == category.id);
    if (index != -1) {
      _categories[index] = category;
      notifyListeners();
    }
  }

  void deleteCategory(String categoryId) {
    _categories.removeWhere((c) => c.id == categoryId);
    notifyListeners();
  }

  void clearAll() {
    _categories.clear();
    notifyListeners();
  }

  void reorderCategoryTasks(
      {required String categoryId, required List<Task> newOrder}) {
    final index = _categories.indexWhere((c) => c.id == categoryId);
    if (index == -1) return;
    final existing = _categories[index];
    _categories[index] = existing.copyWith(tasks: List<Task>.from(newOrder));
    notifyListeners();
  }

  void toggleTask(
      {required String categoryId,
      required String taskId,
      required bool isCompleted}) {
    final index = _categories.indexWhere((c) => c.id == categoryId);
    if (index == -1) return;
    final existing = _categories[index];
    final updatedTasks = existing.tasks
        .map((t) => t.id == taskId ? t.copyWith(isCompleted: isCompleted) : t)
        .toList(growable: false);
    _categories[index] = existing.copyWith(tasks: updatedTasks);
    notifyListeners();
  }
}
