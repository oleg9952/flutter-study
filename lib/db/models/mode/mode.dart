import 'package:isar/isar.dart';

part 'mode.g.dart';

@Collection()
class ModeModel {
  Id? id = Isar.autoIncrement;

  @Index(unique: true)
  late String key;
  late bool value;

  ModeModel({this.id, required this.key, required this.value});
}
