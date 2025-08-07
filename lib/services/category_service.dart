import '../models/category.dart';
import '../repositories/category_repository.dart';

class CategoryService {
  final CategoryRepository repository;

  const CategoryService({required this.repository});

  Future<List<Category>> loadCategories() => repository.getAllCategories();
  Future<void> createCategory(Category category) =>
      repository.addCategory(category);
  Future<void> saveCategory(Category category) =>
      repository.updateCategory(category);
  Future<void> removeCategory(String id) => repository.deleteCategory(id);
  Future<void> removeAll() => repository.clearAll();
}
