import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              //left
            },
          ),
          const Text('Page 1 of 10'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              //right
            },
          ),
        ],
      ),
    );
  }
}
