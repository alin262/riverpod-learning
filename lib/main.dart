import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/screens/todo_screen.dart';
import 'package:riverpod_learning/screens/user_screen.dart';
import './providers/counter_provider.dart';

final counterProvider = StateProvider<int>((ref) => 0);
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Riverpod Learning', home: UserScreen());
  }
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterNotifierProvider);
    return Scaffold(
      appBar: AppBar(title: Text('My First Provider')),
      body: Center(child: Text("$count", style: TextStyle(fontSize: 30))),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        
        children: [
          FloatingActionButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).increment();
            },
            child: Text("+"),
          ),FloatingActionButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).decrement();
            },
            child: Text("-"),
          ),FloatingActionButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).reset();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
