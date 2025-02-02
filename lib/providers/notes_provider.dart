import 'package:flutter/material.dart';
import 'package:notes_app/models/note.dart';

class NotesProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  int get notesCount => _notes.length;
  List<NoteModel> get notes => _notes;

  void addNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void updateNote(NoteModel note) {
    final noteIndex =
        _notes.indexWhere((noteFromList) => noteFromList.id == note.id);
    _notes[noteIndex].title = note.title;
    _notes[noteIndex].text = note.text;
    notifyListeners();
  }

  void deleteNote(String noteId) {
    _notes.removeWhere((noteFromList) => noteFromList.id == noteId);
    notifyListeners();
  }
}
