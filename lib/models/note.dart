import 'package:isar/isar.dart';

part 'note.g.dart';

@Collection()
class NoteModel {
  Id id = Isar.autoIncrement;
  String? title;
  String? text;
}
