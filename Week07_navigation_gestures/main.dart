import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Courses()));

class Courses extends StatelessWidget {
  const Courses({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student Courses')),
    body: Center(
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const CourseDetails()),
        ),
        child: const Text('View MADL course'),
      ),
    ),
  );
}

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});
  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  bool enrolled = false;
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('MADL Course')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Mobile Application Development Lab\nLearn Flutter UI and Dart',
          ),
          GestureDetector(
            onTap: () => setState(() => enrolled = !enrolled),
            child: Container(
              padding: const EdgeInsets.all(24),
              color: Colors.blue.shade100,
              child: Text(
                enrolled ? 'Enrolled! Tap to cancel' : 'Tap to enroll',
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
