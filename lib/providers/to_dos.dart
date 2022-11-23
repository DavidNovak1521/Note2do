import 'package:flutter/material.dart';

import './to_do.dart';

class ToDos with ChangeNotifier {
  // ignore: prefer_final_fields
  List<ToDo> _toDos = [
    ToDo(
      id: 'td1',
      text: 'Első teendő',
      isDone: true,
    ),
    ToDo(
      id: 'td2',
      text: 'Második, de már hosszabb teendő',
      isDone: true,
    ),
    ToDo(
      id: 'td3',
      text: 'Harmadik, de még az előzőnél is hosszabb teendő tesztelni',
      isDone: false,
    ),
    ToDo(
      id: 'td4',
      text:
          'Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő. Ez pedig a leghosszabb teendő.',
      isDone: false,
    ),
    ToDo(
      id: 'td5',
      text: 'Valami teendő 5',
      isDone: false,
    ),
    ToDo(
      id: 'td6',
      text: 'Valami teendő 6',
      isDone: false,
    ),
    ToDo(
      id: 'td7',
      text: 'Valami teendő 7',
      isDone: false,
    ),
    ToDo(
      id: 'td8',
      text: 'Valami teendő 8',
      isDone: false,
    ),
    ToDo(
      id: 'td9',
      text: 'Valami teendő 9',
      isDone: false,
    ),
    ToDo(
      id: 'td10',
      text: 'Valami teendő 10',
      isDone: false,
    ),
  ];

  List<ToDo> get toDos {
    return [..._toDos];
  }

  List<ToDo> get notesTop5 {
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

  void removeToDo(String toRemove) {
    _toDos.removeWhere((todo) => todo.id == toRemove);
    notifyListeners();
  }
}
