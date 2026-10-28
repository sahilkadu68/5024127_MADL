import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Registration()));

class Registration extends StatefulWidget {
  const Registration({super.key});
  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final form = GlobalKey<FormState>();
  String name = '', email = '', result = '';
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Student Registration')),
    body: Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: form,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Student name'),
              onChanged: (v) => name = v.trim(),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Name is required' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              onChanged: (v) => email = v.trim(),
              validator: (v) =>
                  RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                      .hasMatch(v?.trim() ?? '')
                  ? null
                  : 'Enter valid email',
            ),
            ElevatedButton(
              onPressed: () {
                if (form.currentState!.validate()) {
                  setState(() => result = 'Registered: $name\n$email');
                }
              },
              child: const Text('Register'),
            ),
            Text(result),
          ],
        ),
      ),
    ),
  );
}
