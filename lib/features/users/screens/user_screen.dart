import 'package:flutter/material.dart';
import '../providers/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersAsync = ref.watch(userProvider);
    return Scaffold(
      body: usersAsync.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            final user = data[index];
            return ListTile(
              leading: CircleAvatar(child: Text("${user.id}")),
              title: Text(user.name),
              subtitle: Text(user.email),
            );
          },
        ),
        error: (error, stackTrace) => Center(child: Text("Error==$error")),
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
