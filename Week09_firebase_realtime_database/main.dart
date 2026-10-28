import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const apiKey = String.fromEnvironment('FIREBASE_API_KEY');
  const appId = String.fromEnvironment('FIREBASE_APP_ID');
  const sender = String.fromEnvironment('FIREBASE_SENDER_ID');
  const project = String.fromEnvironment('FIREBASE_PROJECT_ID');
  const url = String.fromEnvironment('FIREBASE_DATABASE_URL');
  String? error;
  if ([apiKey, appId, sender, project, url].any((s) => s.isEmpty)) {
    error = 'Firebase configuration missing. See Week09 README.';
  } else {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: apiKey,
          appId: appId,
          messagingSenderId: sender,
          projectId: project,
          databaseURL: url,
        ),
      );
    } catch (e) {
      error = e.toString();
    }
  }
  runApp(
    MaterialApp(
      home: error == null
          ? const DatabaseDemo()
          : Scaffold(body: Center(child: Text(error))),
    ),
  );
}

class DatabaseDemo extends StatefulWidget {
  const DatabaseDemo({super.key});
  @override
  State<DatabaseDemo> createState() => _DatabaseDemoState();
}

class _DatabaseDemoState extends State<DatabaseDemo> {
  final input = TextEditingController(text: 'Hello Firebase');
  final record = FirebaseDatabase.instance.ref('lab/message');
  String result = 'Write a record, then read it';
  Future<void> work(bool write) async {
    try {
      if (write) await record.set(input.text);
      final value = (await record.get()).value;
      if (mounted) setState(() => result = '$value');
    } catch (e) {
      if (mounted) setState(() => result = 'Error: $e');
    }
  }

  @override
  void dispose() {
    input.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Firebase Realtime Database')),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: input),
          ElevatedButton(
            onPressed: () => work(true),
            child: const Text('Write'),
          ),
          ElevatedButton(
            onPressed: () => work(false),
            child: const Text('Read'),
          ),
          Text(result),
        ],
      ),
    ),
  );
}
