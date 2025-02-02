import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NotesProvider extends ChangeNotifier {
  static late Isar _isar;

  final List<NoteModel> _notes = [];

  int get notesCount => _notes.length;
  List<NoteModel> get notes => _notes;

  static Future<void> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([NoteModelSchema], directory: dir.path);
  }

  Future<void> getAllNotes() async {
    final notes = await _isar.noteModels.where().findAll();
    _notes.clear();
    _notes.addAll(notes);
    notifyListeners();
  }

  Future<void> addNote(NoteModel note) async {
    await _isar.writeTxn(() => _isar.noteModels.put(note));
    getAllNotes();
  }

  Future<void> updateNote(NoteModel note) async {
    await _isar.writeTxn(() => _isar.noteModels.put(note));
    await getAllNotes();
  }

  Future<void> deleteNote(int id) async {
    await _isar.writeTxn(() => _isar.noteModels.delete(id));
    await getAllNotes();
  }
}
