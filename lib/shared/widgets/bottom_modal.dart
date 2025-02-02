import 'package:flutter/material.dart';
import 'package:notes_app/providers/theme_provider.dart';
import 'package:provider/provider.dart';

import 'button.dart';
import 'input_field.dart';

class BottomModal extends StatelessWidget {
  final TextEditingController titleFieldController;
  final TextEditingController textFieldController;
  final VoidCallback onSubmit;
  final bool isEditingMode;

  const BottomModal({
    super.key,
    required this.titleFieldController,
    required this.textFieldController,
    this.isEditingMode = false,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Provider.of<ThemeProvider>(context).theme.colorScheme;

    return Container(
      height: 220,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          // Title -----------------------------------
          Text(
            isEditingMode ? 'Edit Note' : 'Add Note',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: colorScheme.inverseSurface),
          ),

          // Form ------------------------------------
          InputField(
            controller: titleFieldController,
            hintText: 'Your new title...',
          ),
          InputField(
            controller: textFieldController,
            hintText: 'Notes text...',
          ),
          const SizedBox(
            height: 10,
          ),
          ValueListenableBuilder(
            valueListenable: titleFieldController,
            builder: (ctx, titleValue, _) {
              return ValueListenableBuilder(
                  valueListenable: textFieldController,
                  builder: (ctx, textValue, _) {
                    final isFormEmpty = titleFieldController.text.isEmpty ||
                        textFieldController.text.isEmpty;

                    return Button(
                        isDisabled: isFormEmpty,
                        onPressed: () => onSubmit(),
                        title: 'Submit');
                  });
            },
          )
        ],
      ),
    );
  }
}
