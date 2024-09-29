import 'package:flutter/material.dart';

import '../../../shared/constants.dart';

class FirstRow extends StatelessWidget {
  final VoidCallback onClearAll;
  final bool isClearAllEnabled;

  const FirstRow(
      {super.key, required this.onClearAll, required this.isClearAllEnabled});

  @override
  Widget build(BuildContext context) {
    final clearBtnColor = isClearAllEnabled ? primaryActionColor : Colors.grey;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Today\'s Tasks',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: () => isClearAllEnabled ? onClearAll() : null,
          child: Text('Clear All'.toUpperCase(),
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: clearBtnColor,
                  decorationColor: clearBtnColor,
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
