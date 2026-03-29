import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/features/users/screens/user_screen.dart';

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

