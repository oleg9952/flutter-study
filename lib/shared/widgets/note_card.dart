import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/note.dart';
import '../../providers/notes_provider.dart';
import '../../providers/theme_provider.dart';
import 'bottom_modal.dart';
import 'section.dart';

class NoteCard extends StatefulWidget {
  final BuildContext pageContext;
  final NoteModel note;

  const NoteCard({super.key, required this.note, required this.pageContext});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    _titleController.text = widget.note.title;
    _textController.text = widget.note.text;
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<ThemeProvider>(context).theme.colorScheme;

    return Section(children: [
      Row(
        children: [
          // Left side ---------------------------------------
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.note.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: colorScheme.inverseSurface),
                ),
                Text(
                  widget.note.text,
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),

          // Right side ---------------------------------------
          Row(
            children: [
              IconButton(
                  onPressed: () => startWorkingWithNote(context),
                  icon: Icon(
                    Icons.edit,
                    color: colorScheme.primary,
                  )),
              IconButton(
                  onPressed: () {
                    context.read<NotesProvider>().deleteNote(widget.note.id);
                  },
                  icon: Icon(
                    Icons.delete_forever,
                    color: colorScheme.error,
                  )),
            ],
          )
        ],
      ),
    ]);
  }

  void startWorkingWithNote(BuildContext context) {
    final colorScheme = context.read<ThemeProvider>().theme.colorScheme;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      backgroundColor: colorScheme.surface,
      builder: (ctx) => Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(widget.pageContext).viewInsets.bottom),
        child: BottomModal(
          isEditingMode: true,
          titleFieldController: _titleController,
          textFieldController: _textController,
          onSubmit: () {
            final updatedNote = NoteModel(
                id: widget.note.id,
                title: _titleController.text,
                text: _textController.text);
            context.read<NotesProvider>().updateNote(updatedNote);
            Navigator.pop(ctx);
          },
        ),
      ),
    );
  }
}
