import "package:flutter_riverpod/flutter_riverpod.dart";

class TodoNotifier extends StateNotifier<List<String>>{
  TodoNotifier():super([]);
  void addTodo(String todo){
    state=[...state,todo];
  }
  void deleteTodo(int index){
    state=[...state]..removeAt(index);

  }
}
final todoProvider=StateNotifierProvider<TodoNotifier,List<String>>((ref) {
  return TodoNotifier();
},);