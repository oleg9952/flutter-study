import 'package:notes_app/shared/utils/id_generator.dart';

class NoteModel {
  String id;
  String title;
  String text;

  NoteModel({required this.title, required this.text, String? id})
      : id = id ?? generateId();
}
