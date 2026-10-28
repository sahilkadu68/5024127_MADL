import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Student Portal')),
      body: const Center(
        child: Text(
          'Hello World\nWelcome, IT students!',
          textAlign: TextAlign.center,
        ),
      ),
    ),
  ),
);
