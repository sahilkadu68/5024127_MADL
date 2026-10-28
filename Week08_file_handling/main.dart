import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MaterialApp(home: StudentNotes()));

class StudentNotes extends StatefulWidget {
  const StudentNotes({super.key});
  @override
  State<StudentNotes> createState() => _StudentNotesState();
}

class _StudentNotesState extends State<StudentNotes> {
  final note = TextEditingController(text: 'MADL practical on Monday');
  String status = 'Write a note and save it';
  Future<void> work(bool save) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/student_note.txt');
      if (save) {
        await file.writeAsString(note.text);
        if (mounted) setState(() => status = 'Note saved');
      } else {
        final text = await file.exists() ? await file.readAsString() : '';
        if (!mounted) return;
        note.text = text;
        setState(() => status = text.isEmpty ? 'No saved note' : 'Note loaded');
      }
    } catch (e) {
      if (mounted) setState(() => status = 'Error: $e');
    }
  }

  @override
  void dispose() {
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student Notes')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            controller: note,
            decoration: const InputDecoration(labelText: 'Study note'),
          ),
          ElevatedButton(
            onPressed: () => work(true),
            child: const Text('Save note'),
          ),
          ElevatedButton(
            onPressed: () => work(false),
            child: const Text('Load note'),
          ),
          Text(status),
        ],
      ),
    ),
  );
}
