import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final String id;
  final String title;
  final bool isCompleted;
  final ValueChanged<bool>? onToggle;

  const TaskItem({
    super.key,
    required this.id,
    required this.title,
    required this.isCompleted,
    this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = Theme.of(context).colorScheme.outlineVariant;
    final Color tileColor = Theme.of(context).colorScheme.surface;
    final Color completedColor = Theme.of(context).colorScheme.primary;

    return Container(
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      child: Row(
        children: [
          GestureDetector(
            onTap: onToggle != null ? () => onToggle!(!isCompleted) : null,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? completedColor : Colors.transparent,
                border: Border.all(
                  color: isCompleted ? completedColor : borderColor,
                  width: 2,
                ),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    color: isCompleted
                        ? Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.color
                            ?.withOpacity(0.5)
                        : Theme.of(context).textTheme.titleLarge?.color,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
