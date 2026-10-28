import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MaterialApp(home: FileDemo()));

class FileDemo extends StatefulWidget {
  const FileDemo({super.key});
  @override
  State<FileDemo> createState() => _FileDemoState();
}

class _FileDemoState extends State<FileDemo> {
  String text = 'Press save, then read';
  Future<File> get file async =>
      File('${(await getApplicationDocumentsDirectory()).path}/note.txt');
  Future<void> save() async {
    try {
      await (await file).writeAsString('Hello from a file!');
      if (mounted) setState(() => text = 'Saved');
    } catch (e) {
      if (mounted) setState(() => text = 'Error: $e');
    }
  }

  Future<void> read() async {
    try {
      final f = await file;
      final value = await f.exists() ? await f.readAsString() : 'No file yet';
      if (mounted) setState(() => text = value);
    } catch (e) {
      if (mounted) setState(() => text = 'Error: $e');
    }
  }

  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('File Handling')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          ElevatedButton(onPressed: save, child: const Text('Write file')),
          ElevatedButton(onPressed: read, child: const Text('Read file')),
        ],
      ),
    ),
  );
}
