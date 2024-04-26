import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String month;
  final String year;

  const Header({super.key, required this.month, required this.year});

  @override
  Widget build(BuildContext context) {
    return Text('$month $year', style: const TextStyle(fontSize: 24));
  }
}

class MoonPhaseKey extends StatelessWidget {
  const MoonPhaseKey({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.brightness_3, color: Color.fromARGB(255, 1, 87, 138)), // New moon icon
        Text('New Moon'),
        SizedBox(width: 16),
        Icon(Icons.brightness_7,color: Color.fromARGB(255, 198, 243, 33)), // Full moon icon
        Text('Full Moon'),
      ],
    );
  }
}

class QuestionText extends StatelessWidget {
  final String questionText;

  const QuestionText({super.key, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: Text(
        questionText,
        style: const TextStyle(fontSize: 14),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class DayOfWeekHeaders extends StatelessWidget {
  static const List<String> daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  const DayOfWeekHeaders({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600), // Set your desired max width here
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: daysOfWeek
              .map((day) => Expanded(child: Text(day, textAlign: TextAlign.center)))
              .toList(),
        ),
      ),
    );
  }
}
