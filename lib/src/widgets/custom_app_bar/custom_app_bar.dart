import 'package:flutter/material.dart';
import 'package:todo_app/src/widgets/custom_app_bar/widgets/first_row.dart';
import 'package:todo_app/src/widgets/custom_app_bar/widgets/second_row.dart';

class CustomAppBar extends StatelessWidget {
  final int todosCount;
  final int completedTodosCount;
  final VoidCallback onClearAll;

  const CustomAppBar({
    super.key,
    required this.onClearAll,
    required this.todosCount,
    required this.completedTodosCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: [
          FirstRow(onClearAll: () => _showClearAllConfirmation(context)),
          SecondRow(
            todosCount: todosCount,
            completedTodosCount: completedTodosCount,
          )
        ],
      ),
    );
  }

  void _showClearAllConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Clear All Tasks'),
          content: const Text('Are you sure you want to clear all tasks?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Clear'),
              onPressed: () {
                Navigator.of(context).pop();
                onClearAll();
              },
            ),
          ],
        );
      },
    );
  }
}
