import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  int currentPage;
  int totalPages;

  CustomBottomNavigationBar({
    required this.onNext, 
    required this.onPrevious, 
    required this.currentPage, 
    required this.totalPages
  });


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onPrevious,
          ),
          Text('Page $currentPage of $totalPages'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
