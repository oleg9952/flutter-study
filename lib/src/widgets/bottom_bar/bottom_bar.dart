import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/src/shared/constants.dart';

class BottomBar extends StatefulWidget {
  final void Function(String todoName) onAddTodo;

  const BottomBar({
    super.key,
    required this.onAddTodo,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  void _handleAddTodo() {
    if (_controller.text.isNotEmpty) {
      widget.onAddTodo(_controller.text);
      _controller.clear();
      _focusNode.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xB59E9E9E), width: 1)),
      ),
      child: Column(
        children: [
          // TextField
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              onSubmitted: (_) => _handleAddTodo(),
              decoration: const InputDecoration(
                hintText: 'Add a new task...',
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: primaryActionColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Add button
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 0),
            // height: 50,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 55,
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: primaryActionColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: _handleAddTodo,
                        child: Text(
                          'Add task'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
