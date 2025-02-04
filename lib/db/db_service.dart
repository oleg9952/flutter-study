import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'models/mode/mode.dart';
import 'models/note/note.dart';

class DBService {
  static late Isar _isar;

  static Isar get db => _isar;

  static Future<void> initDB() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open([NoteModelSchema, ModeModelSchema],
        directory: dir.path);
  }
}
