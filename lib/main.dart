import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);
void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Riverpod Learning', home: CounterScreen());
  }
}

class CounterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count=ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('My First Provider')),
      body: Center(
        child: Text("$count", style: TextStyle(fontSize: 30)),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        ref.read(counterProvider.notifier).state++;
      },child: Text("+"),),
    );
  }
}
