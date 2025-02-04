import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../db/db_service.dart';
import '../db/models/note/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  int get notesCount => _notes.length;
  List<NoteModel> get notes => _notes;

  Future<void> getAllNotes() async {
    final notes = await DBService.db.noteModels.where().findAll();
    _notes.clear();
    _notes.addAll(notes);
    notifyListeners();
  }

  Future<void> addNote(NoteModel note) async {
    await DBService.db.writeTxn(() => DBService.db.noteModels.put(note));
    getAllNotes();
  }

  Future<void> updateNote(NoteModel note) async {
    await DBService.db.writeTxn(() => DBService.db.noteModels.put(note));
    await getAllNotes();
  }

  Future<void> deleteNote(int id) async {
    await DBService.db.writeTxn(() => DBService.db.noteModels.delete(id));
    await getAllNotes();
  }
}
