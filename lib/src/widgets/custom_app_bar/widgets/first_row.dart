import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class FirstRow extends StatelessWidget {
  final VoidCallback onClearAll;

  const FirstRow({super.key, required this.onClearAll});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Today\'s Tasks',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: onClearAll,
          child: Text('Clear All'.toUpperCase(),
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primaryActionColor,
                  decorationColor: primaryActionColor,
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
