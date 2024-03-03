import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentPage = 1; // Current page number
  int _totalPages = 10; // Total number of pages

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              // Move to the previous page
              setState(() {
                if (_currentPage > 1) {
                  _currentPage--;
                }
              });
            },
          ),
          Text('Page $_currentPage of $_totalPages'),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              // Move to the next page
              setState(() {
                if (_currentPage < _totalPages) {
                  _currentPage++;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
