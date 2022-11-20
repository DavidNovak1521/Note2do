import 'package:flutter/material.dart';

import './goal.dart';

class Goals with ChangeNotifier {
  // ignore: prefer_final_fields
  List<Goal> _goals = [
    Goal(
      id: 'g1',
      text: 'Első cél',
      isDone: true,
    ),
    Goal(
      id: 'g2',
      text: 'Második, de már hosszabb cél',
      isDone: false,
    ),
    Goal(
      id: 'g3',
      text: 'Harmadik, de még az előzőnél is hosszabb cél tesztelni',
      isDone: false,
    ),
    Goal(
      id: 'g4',
      text:
          'Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél. Ez pedig a leghosszabb cél.',
      isDone: true,
    ),
    Goal(
      id: 'g5',
      text: 'Valami cél 5',
      isDone: true,
    ),
    Goal(
      id: 'g6',
      text: 'Valami cél 6',
      isDone: false,
    ),
    Goal(
      id: 'g7',
      text: 'Valami cél 7',
      isDone: false,
    ),
    Goal(
      id: 'g8',
      text: 'Valami cél 8',
      isDone: false,
    ),
    Goal(
      id: 'g9',
      text: 'Valami cél 9',
      isDone: true,
    ),
    Goal(
      id: 'g10',
      text: 'Valami cél 10',
      isDone: false,
    ),
  ];

  List<Goal> get goals {
    return [..._goals];
  }

  void addGoal() {
    // _goals.add(value);
    notifyListeners();
  }
}