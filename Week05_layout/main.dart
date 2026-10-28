import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text('Student Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.blue.shade100,
              padding: const EdgeInsets.all(20),
              child: const Row(
                children: [
                  Icon(Icons.account_circle, size: 48),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Asha Patil'),
                      Text('Roll No: 27 | IT Semester V'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Attendance\n85%'),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('Credits\n20'),
                    ),
                  ),
                ),
              ],
            ),
            const Expanded(
              child: Center(child: Text('Subjects: MADL, DBMS, Networks')),
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text('Academic year 2026-27'),
            ),
          ],
        ),
      ),
    ),
  ),
);
