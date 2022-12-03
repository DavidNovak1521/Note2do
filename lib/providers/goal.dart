import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'goals.dart';

class GlobalGoalDate {
  // ignore: prefer_typing_uninitialized_variables
  static var date =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
          .add(const Duration(days: 1));
}

class Goal with ChangeNotifier {
  final String id;
  final String text;
  final DateTime date;
  bool isDone;

  Goal({
    required this.id,
    required this.text,
    required this.date,
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
