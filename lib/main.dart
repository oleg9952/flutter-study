import 'package:flutter/material.dart';
import './user_id.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserId()
    );
  }
}