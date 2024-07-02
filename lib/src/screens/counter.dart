import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('pressed 0 times'),
            ElevatedButton(
              child: const Text("press to count"),
              onPressed: () async {
                print('incremenet...');
              },
            ),
          ],
        ),
      ),
    );
  }
}
