import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'to_dos.dart';

enum ToDoType { day, week, month }

class GlobalToDoType {
  // ignore: prefer_typing_uninitialized_variables
  static var type = ToDoType.day;
}

class ToDo with ChangeNotifier {
  final String id;
  final String text;
  final ToDoType type;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    required this.type,
    required this.isDone,
  });

  String getText() {
    return text;
  }

  void changeDoneStatus(BuildContext context) {
    isDone = !isDone;
    notifyListeners();
    Provider.of<ToDos>(context, listen: false).refreshTodo(this);
  }
}
