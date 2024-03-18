import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrevious;
  final int currentPage;
  final int totalPages;

  const CustomBottomNavigationBar({
    Key? key, 
    required this.onNext, 
    required this.onPrevious, 
    required this.currentPage, 
    required this.totalPages
  }) : super(key: key);



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
