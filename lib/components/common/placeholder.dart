import 'package:flutter/widgets.dart';

class PlaceholderBox extends StatelessWidget {
  final double width;
  final double height;

  const PlaceholderBox({super.key, this.width = 24, this.height = 24});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, height: height);
  }
}
