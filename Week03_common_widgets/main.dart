import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Demo()));

class Demo extends StatelessWidget {
  const Demo({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Common Widgets')),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            color: Colors.amber,
            child: const Text('Container'),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.star), Text('Row + Icon')],
          ),
          const TextField(decoration: InputDecoration(labelText: 'Type here')),
          ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Button pressed'))),
            child: const Text('Button'),
          ),
        ],
      ),
    ),
  );
}
