import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentPageIndex;
  final Function(int) onPageChanged;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentPageIndex,
    required this.onPageChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              onPageChanged(currentPageIndex - 1); // Go to previous page
            },
          ),
          Text('Page ${currentPageIndex + 1} of 3'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              onPageChanged(currentPageIndex + 1); // Go to next page
            },
          ),
        ],
      ),
    );
  }
}
