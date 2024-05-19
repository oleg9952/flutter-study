import 'package:flutter/material.dart';

class SecondRow extends StatelessWidget {
  final int todosCount;
  final int completedTodosCount;

  const SecondRow(
      {super.key, required this.todosCount, required this.completedTodosCount});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3, top: 10),
          child: Text(
            '($completedTodosCount/$todosCount) Completed Tasks',
            style: TextStyle(fontSize: 16, color: Colors.blueGrey),
          ),
        )
      ],
    );
  }
}
