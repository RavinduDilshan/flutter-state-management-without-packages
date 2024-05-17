import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterScreenUsingAnotherMethod extends StatelessWidget {
  const CounterScreenUsingAnotherMethod({super.key});

  @override
  Widget build(BuildContext context) {
    var counter = ValueNotifier<int>(0);
    return Scaffold(
      appBar: AppBar(
        title: const Text('counter using another method'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                  counter.value++;
                },
                child: const Text('increment counter'))
          ],
        ),
      ),
    );
  }
}
