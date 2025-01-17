import 'package:flutter/material.dart';

import '../model/counter.dart';

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Valor: ${_counter.value}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _counter.increment();
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  _counter.decrement();
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
