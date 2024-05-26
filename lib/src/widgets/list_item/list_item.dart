import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final String title;
  final bool isDone;
  final void Function(bool?) onChanged;
  final void Function() onDelete;

  const ListItem(
      {super.key,
      required this.isDone,
      required this.title,
      required this.onDelete,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(spreadRadius: -4, blurRadius: 5, offset: Offset(0, 0))
              ]),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => onChanged(!isDone),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: isDone,
                        onChanged: (_) => onChanged(!isDone),
                      ),
                      const SizedBox(width: 5),
                      Text(title,
                          style: TextStyle(
                              color: isDone ? Colors.grey : Colors.black,
                              fontSize: 16,
                              decoration:
                                  isDone ? TextDecoration.lineThrough : null,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.red.withOpacity(0.09),
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: IconButton(
                    icon: const Icon(Icons.delete_forever),
                    color: Colors.red,
                    onPressed: () => onDelete(),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
