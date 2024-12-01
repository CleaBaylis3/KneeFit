import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ConnectToBraceScreen extends StatelessWidget {
  const ConnectToBraceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connect to Brace'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'This is the Connect to Brace screen.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
