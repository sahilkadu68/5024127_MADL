import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: First()));

class First extends StatelessWidget {
  const First({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Screen One')),
    body: Center(
      child: ElevatedButton(
        onPressed: () => Navigator.push(
          c,
          MaterialPageRoute(builder: (_) => const Second()),
        ),
        child: const Text('Go to screen two'),
      ),
    ),
  );
}

class Second extends StatelessWidget {
  const Second({super.key});
  @override
  Widget build(BuildContext c) => Scaffold(
    appBar: AppBar(title: const Text('Screen Two')),
    body: Center(
      child: GestureDetector(
        onTap: () =>
            ScaffoldMessenger.of(c)
                .showSnackBar(const SnackBar(content: Text('Tapped!'))),
        child: const Padding(
          padding: EdgeInsets.all(30),
          child: Text('Tap me'),
        ),
      ),
    ),
  );
}
