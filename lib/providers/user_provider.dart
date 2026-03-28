import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_learning/models/user_model.dart';

final userProvider = FutureProvider<List<User>>((ref) async {
  final response = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/users"),
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((j) => User.fromJson(j)).toList();
  } else {
    throw Exception("failed to load users");
  }
});
