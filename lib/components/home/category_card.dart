import 'package:flutter/material.dart';
import 'package:project_6/models/category.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
    this.onLongPress,
  });

  Color _placeholderColorFromId(String id) {
    final hash = id.codeUnits.fold<int>(0, (acc, c) => (acc + c) % 360);
    return HSVColor.fromAHSV(1.0, hash.toDouble(), 0.25, 0.95).toColor();
  }

  @override
  Widget build(BuildContext context) {
    final total = category.tasks.length;
    final completed = category.tasks.where((t) => t.isCompleted).length;
    final isCompleted = total > 0 && completed == total;

    final bgColor = isCompleted
        ? Colors.grey.shade300
        : _placeholderColorFromId(category.id);

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      borderRadius: BorderRadius.circular(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Placeholder background instead of images for now
            Container(color: bgColor),

            // Desaturate for completed look
            if (isCompleted)
              Container(
                color: Colors.white.withOpacity(0.4),
              ),

            // Bottom gradient overlay for text readability
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Color.fromARGB(160, 0, 0, 0),
                  ],
                ),
              ),
            ),

            // Text content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    category.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '$completed/$total tasks',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
