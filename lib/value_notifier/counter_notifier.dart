import 'package:flutter/material.dart';

class CounterNotifier extends ValueNotifier {
  CounterNotifier(super.value);

  void incrementCounter() {
    value++;
  }
}
