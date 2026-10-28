import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Student Attendance')),
      body: Column(
        children: [
          const Icon(Icons.school, color: Colors.blue, size: 40),
          Image.asset('assets/flutter.png', height: 80),
          const Text('Flutter Study Club'),
          const SizedBox(height: 20),
          const Text('Attendance by subject (%)'),
          const SizedBox(
            height: 150,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AttendanceBar('MADL', 90),
                AttendanceBar('DBMS', 75),
                AttendanceBar('Networks', 80),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);

class AttendanceBar extends StatelessWidget {
  final String subject;
  final double percent;
  const AttendanceBar(this.subject, this.percent, {super.key});
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${percent.toInt()}%'),
      Container(width: 40, height: percent, color: Colors.blue),
      Text(subject),
    ],
  );
}
