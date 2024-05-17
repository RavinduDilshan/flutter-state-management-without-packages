import 'package:flutter/material.dart';
import 'package:pronew/value_notifier/counter_notifier.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CounterNotifier counter = CounterNotifier(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ValueListenableBuilder(
            builder: (context, value, child) {
              return Text(
                '$value',
                style: const TextStyle(fontSize: 40),
              );
            },
            valueListenable: counter,
          ),
          TextButton(
              onPressed: () {
                //increment counter
                counter.incrementCounter();
              },
              child: const Text('increase counter')),
        ]),
      ),
    );
  }
}
