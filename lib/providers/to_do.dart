import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'to_dos.dart';

class ToDo with ChangeNotifier {
  final String id;
  final String text;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    required this.isDone,
  });

  void changeDoneStatus(BuildContext context) {
    isDone = !isDone;
    notifyListeners();
    Provider.of<ToDos>(context, listen: false).refreshTodo(this);
  }
}
