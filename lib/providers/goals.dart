import 'package:flutter/material.dart';

import './goal.dart';

class Goals with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Goal> _goals = [
    Goal(
      id: 'g1',
      text: 'Első cél',
      isDone: true,
      date: DateTime.now(),
    ),
    Goal(
      id: 'g2',
      text: 'Második, de már hosszabb cél',
      isDone: false,
      date: DateTime.now().add(const Duration(days: 1)),
    ),
    Goal(
      id: 'g3',
      text: 'Harmadik, de még az előzőnél is hosszabb cél tesztelni',
      isDone: false,
      date: DateTime.now().add(const Duration(days: 5)),
    ),
    Goal(
      id: 'g4',
      text:
          'Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél.',
      isDone: true,
      date: DateTime.now().add(const Duration(days: 10)),
    ),
    Goal(
      id: 'g5',
      text: 'Valami cél 5',
      isDone: true,
      date: DateTime.now().add(const Duration(days: 14)),
    ),
    Goal(
      id: 'g6',
      text: 'Valami cél 6',
      isDone: false,
      date: DateTime.now().add(const Duration(days: 30)),
    ),
    Goal(
      id: 'g7',
      text: 'Valami cél 7',
      isDone: false,
      date: DateTime.now().add(const Duration(days: 31)),
    ),
    Goal(
      id: 'g8',
      text: 'Valami cél 8',
      isDone: false,
      date: DateTime.now().add(const Duration(days: 40)),
    ),
    Goal(
      id: 'g9',
      text: 'Valami cél 9',
      isDone: true,
      date: DateTime.now().add(const Duration(days: 45)),
    ),
    Goal(
      id: 'g10',
      text: 'Valami cél 10',
      isDone: false,
      date: DateTime.now().add(const Duration(days: 365)),
    ),
  ];

  List<Goal> get goals {
    return [..._goals];
  }

  List<Goal> get goalsTop5 {
    if (_goals.length >= 5) {
      return [..._goals.take(5)];
    } else {
      return [..._goals];
    }
  }

  void refreshTodo(Goal data) {
    final index = _goals.indexOf(data);
    _goals[index] = data;
    notifyListeners();
  }

  void addGoal(Goal toAdd) {
    _goals.insert(0, toAdd);
    notifyListeners();
  }

  void addGoalByString(String toAdd) {
    final index = _goals.indexWhere((goal) =>
        GlobalGoalDate.date.compareTo(goal.date) == 0 ||
        GlobalGoalDate.date.compareTo(goal.date) < 0);
    _goals.insert(
      index,
      Goal(
        id: DateTime.now().toString(),
        text: toAdd,
        date: GlobalGoalDate.date,
        isDone: false,
      ),
    );
    notifyListeners();
  }

  void removeGoal(String toRemove) {
    _goals.removeWhere((goal) => goal.id == toRemove);
    notifyListeners();
  }
}
