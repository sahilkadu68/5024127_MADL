import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: FormDemo()));

class FormDemo extends StatefulWidget {
  const FormDemo({super.key});
  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Simple Form')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: key,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (v) => v!.contains('@') ? null : 'Enter valid email',
            ),
            ElevatedButton(
              onPressed: () {
                if (key.currentState!.validate()) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(const SnackBar(content: Text('Submitted')));
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    ),
  );
}
