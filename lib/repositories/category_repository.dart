import '../models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getAllCategories();
  Future<void> addCategory(Category category);
  Future<void> updateCategory(Category category);
  Future<void> deleteCategory(String categoryId);
  Future<void> clearAll();
}
