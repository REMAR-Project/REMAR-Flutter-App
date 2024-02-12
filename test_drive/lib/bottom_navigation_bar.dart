import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              //left
            },
          ),
          Text('Page 1 of 10'),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              //right
            },
          ),
        ],
      ),
    );
  }
}