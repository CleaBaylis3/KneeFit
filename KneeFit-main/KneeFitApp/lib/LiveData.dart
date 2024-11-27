import 'package:flutter/material.dart';

class LiveDataScreen extends StatelessWidget {
  const LiveDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Live Data'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Aligns content to the bottom
        crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
        children: [
          const Text(
            'This is where live data will be displayed',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20), // Add some padding from the bottom
        ],
      ),
    );
  }
}
