import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Icon, Image, Chart')),
      body: Column(
        children: [
          Icon(Icons.favorite, color: Colors.red, size: 40),
          Image.asset('assets/flutter.png', height: 100),
          Text('Sample chart'),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Bar(40), Bar(80), Bar(60)],
            ),
          ),
        ],
      ),
    ),
  ),
);

class Bar extends StatelessWidget {
  final double h;
  const Bar(this.h, {super.key});
  @override
  Widget build(BuildContext c) =>
      Container(width: 40, height: h, color: Colors.blue);
}
