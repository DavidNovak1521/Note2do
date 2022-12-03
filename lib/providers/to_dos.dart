import 'package:flutter/material.dart';

import './to_do.dart';

class ToDos with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ToDo> _toDos = [
    ToDo(
      id: 'td1',
      text: 'Első teendő',
      type: ToDoType.day,
      isDone: true,
    ),
    ToDo(
      id: 'td2',
      text: 'Második, de már hosszabb teendő',
      type: ToDoType.day,
      isDone: false,
    ),
    ToDo(
      id: 'td3',
      text: 'Harmadik, de még az előzőnél is hosszabb teendő tesztelni',
      type: ToDoType.week,
      isDone: true,
    ),
    ToDo(
      id: 'td4',
      text:
          'Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő.',
      type: ToDoType.month,
      isDone: false,
    ),
    ToDo(
      id: 'td5',
      text: 'Valami teendő 5',
      type: ToDoType.month,
      isDone: true,
    ),
    ToDo(
      id: 'td6',
      text: 'Valami teendő 6',
      type: ToDoType.month,
      isDone: false,
    ),
    ToDo(
      id: 'td7',
      text: 'Valami teendő 7',
      type: ToDoType.month,
      isDone: false,
    ),
    ToDo(
      id: 'td8',
      text: 'Valami teendő 8',
      type: ToDoType.month,
      isDone: false,
    ),
    ToDo(
      id: 'td9',
      text: 'Valami teendő 9',
      type: ToDoType.month,
      isDone: false,
    ),
    ToDo(
      id: 'td10',
      text: 'Valami teendő 10',
      type: ToDoType.month,
      isDone: false,
    ),
  ];

  List<ToDo> get toDos {
    return [..._toDos];
  }

  List<ToDo> get toDosDay {
    return [..._toDos.where((todo) => todo.type == ToDoType.day)];
  }

  List<ToDo> get toDosWeek {
    return [..._toDos.where((todo) => todo.type == ToDoType.week)];
  }

  List<ToDo> get toDosMonth {
    return [..._toDos.where((todo) => todo.type == ToDoType.month)];
  }

  List<ToDo> get toDosTop5 {
    if (_toDos.length >= 5) {
      return [..._toDos.take(5)];
    } else {
      return [..._toDos];
    }
  }

  void refreshTodo(ToDo data) {
    final index = _toDos.indexOf(data);
    _toDos[index] = data;
    notifyListeners();
  }

  void addToDo(ToDo toAdd) {
    _toDos.insert(0, toAdd);
    notifyListeners();
  }

  void addToDoByString(String toAdd, ToDoType type) {
    _toDos.insert(
      0,
      ToDo(
        id: DateTime.now().toString(),
        text: toAdd,
        type: type,
        isDone: false,
      ),
    );
    notifyListeners();
  }

  void removeToDo(String toRemove) {
    _toDos.removeWhere((todo) => todo.id == toRemove);
    notifyListeners();
  }
}
