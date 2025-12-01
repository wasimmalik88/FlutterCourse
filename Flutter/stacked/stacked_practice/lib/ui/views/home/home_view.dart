import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_practice/ui/views/home/home_viewmodel.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CounterViewModel>.reactive(
      viewModelBuilder: () => CounterViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text('Stacked Counter')),
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'You have pushed the button this many times:',
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  model.counter.toString(),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: model.decrement,
                child: const Icon(Icons.remove),
              ),
              const SizedBox(width: 12),
              FloatingActionButton(
                onPressed: model.increment,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        );
      },
    );
  }
}
