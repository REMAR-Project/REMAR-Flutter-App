import 'package:flutter/material.dart';

class MoonCalendar extends StatelessWidget {
  const MoonCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 7,
        children: List.generate(30, (index) {
          bool shouldDisplayImage = (index + 1 == 3 || index + 1 == 6);
          return Center(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    if (shouldDisplayImage)
                      Image.network('https://example.com/image.jpg'),
                    Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
    );
  }
}