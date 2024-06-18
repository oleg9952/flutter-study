import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String title;
  final bool isDone;
  final bool isReordering;
  final void Function(bool?) onChanged;
  final void Function() onDelete;

  const Item({
    super.key,
    required this.title,
    required this.isDone,
    this.isReordering = false,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isReordering ? 2 : 0,
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        horizontalTitleGap: 0,
        leading: Checkbox(
          value: isDone,
          onChanged: (_) => onChanged(!isDone),
        ),
        title: GestureDetector(
          onTap: () => onChanged(!isDone),
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(title,
                style: TextStyle(
                    color: isDone ? Colors.grey : Colors.black,
                    fontSize: 16,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        trailing: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: isReordering
                  ? Colors.blue.withOpacity(0.09)
                  : Colors.red.withOpacity(0.09),
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: isReordering
              ? IconButton(
                  icon: const Icon(Icons.reorder),
                  color: Colors.blue,
                  onPressed: () => onDelete(),
                )
              : IconButton(
                  icon: const Icon(Icons.delete_forever),
                  color: Colors.red,
                  onPressed: () => onDelete(),
                ),
        ),
      ),
    );
  }
}
