import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Layout Widgets')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Column'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Chip(label: Text('Row')),
                Chip(label: Text('Widgets')),
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  color: Colors.lightBlue,
                  padding: EdgeInsets.all(24),
                  child: Text('Expanded + Container'),
                ),
              ),
            ),
            Align(alignment: Alignment.bottomRight, child: Text('Align')),
          ],
        ),
      ),
    ),
  ),
);
