import 'dart:ui';

import 'package:flutter/material.dart';

class UserImg extends StatelessWidget {
  const UserImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 150,
          width: 150,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(
              color: Colors.black,
              blurRadius: 15.0,
              spreadRadius: -7.0,
              offset: Offset(0, 2)
            )],
          ),
          child: Image.asset('assets/images/user.png'),
        ),
      ],
    );
  }
}