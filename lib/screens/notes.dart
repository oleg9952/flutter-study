import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../db/models/note/note.dart';
import '../shared/widgets/main_drawer.dart';
import '../providers/theme_provider.dart';
import '../providers/notes_provider.dart';
import '../shared/widgets/note_card.dart';
import '../shared/widgets/bottom_modal.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final TextEditingController _titleFieldController = TextEditingController();
  final TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    Provider.of<NotesProvider>(context, listen: false).getAllNotes();
    super.initState();
  }

  @override
  void dispose() {
    _titleFieldController.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<ThemeProvider>(context).theme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      drawer: const MainDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: colorScheme.inverseSurface),
        backgroundColor: colorScheme.surface,
        title: Text(
          'Notes',
          style: TextStyle(color: colorScheme.inverseSurface),
        ),
      ),
      body: Consumer<NotesProvider>(
          builder: (ctx, notesProvider, _) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: notesProvider.notesCount == 0
                    ? const Center(
                        heightFactor: 5,
                        child: Icon(
                          Icons.note_alt_sharp,
                          size: 120,
                          color: Colors.grey,
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            child: ListView.separated(
                                separatorBuilder: (_, index) => const SizedBox(
                                      height: 5,
                                    ),
                                itemCount: notesProvider.notesCount,
                                itemBuilder: (_, index) {
                                  return NoteCard(
                                    pageContext: context,
                                    note: notesProvider.notes[index],
                                  );
                                }),
                          )
                        ],
                      ),
              )),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: colorScheme.primary,
        onPressed: () => startWorkingWithNote(context),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  void startWorkingWithNote(BuildContext context) {
    final colorScheme = context.read<ThemeProvider>().theme.colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: colorScheme.surface,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
        child: BottomModal(
          titleFieldController: _titleFieldController,
          textFieldController: _textFieldController,
          onSubmit: () {
            addNote(ctx);
          },
        ),
      ),
    ).whenComplete(() {
      Future.delayed(const Duration(milliseconds: 100), () {
        _titleFieldController.clear();
        _textFieldController.clear();
      });
    });
  }

  void addNote(BuildContext ctx) {
    final isTitleEmpty = _titleFieldController.text.isEmpty;
    final isTextEmpty = _textFieldController.text.isEmpty;

    if (isTitleEmpty || isTextEmpty) {
      return;
    }

    final newNote = NoteModel()
      ..title = _titleFieldController.text
      ..text = _textFieldController.text;

    ctx.read<NotesProvider>().addNote(newNote);
    Navigator.pop(ctx);
  }
}
