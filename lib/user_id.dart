import 'package:flutter/material.dart';
import './widgets/user_img.dart';

class UserId extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        title: Text('User ID'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
      ),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            UserImg(),
            SizedBox(height: 40),
            Text(
              'NAME',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'James',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            SizedBox(height: 30),
            Text(
              'CURRENT LEVEL',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '5',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.email,
                    color: Colors.blueGrey[800],
                  ),
                ),
                Text(
                  'james@gmail.com',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blueGrey[800],
                  ),
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}

