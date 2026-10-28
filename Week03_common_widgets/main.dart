import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: StudentCard()));

class StudentCard extends StatefulWidget {
  const StudentCard({super.key});
  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> {
  String name = 'Student';
  String enteredName = '';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student ID Card')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue.shade100,
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.school),
                    SizedBox(width: 8),
                    Text('IT Department'),
                  ],
                ),
                Text(name, style: const TextStyle(fontSize: 24)),
                const Text('BTech IT - Semester V'),
              ],
            ),
          ),
          TextField(
            decoration: const InputDecoration(labelText: 'Student name'),
            onChanged: (value) => enteredName = value,
          ),
          ElevatedButton(
            onPressed: () => setState(() {
              name = enteredName.trim().isEmpty
                  ? 'Student'
                  : enteredName.trim();
            }),
            child: const Text('Update card'),
          ),
        ],
      ),
    ),
  );
}
