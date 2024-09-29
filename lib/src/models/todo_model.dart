import 'package:hive/hive.dart';

part 'adapters/todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  bool isDone;

  TodoModel({required this.title, this.isDone = false});
}
