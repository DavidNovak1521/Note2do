import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'goals.dart';

class Goal with ChangeNotifier {
  final String id;
  final String text;
  bool isDone;

  Goal({
    required this.id,
    required this.text,
    required this.isDone,
  });

  String getText() {
    return text;
  }

  void changeDoneStatus(BuildContext context) {
    isDone = !isDone;
    notifyListeners();
    Provider.of<Goals>(context, listen: false).refreshTodo(this);
  }
}
