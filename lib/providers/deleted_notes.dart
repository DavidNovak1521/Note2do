import 'package:flutter/material.dart';

class DeletedNotes with ChangeNotifier {
  // ignore: prefer_final_fields
  List<dynamic> _deletedNotes = [];

  List<dynamic> get deletedNotes {
    return [..._deletedNotes];
  }

  void addNote(dynamic toAdd) {
    _deletedNotes.insert(
      0,
      toAdd,
    );
    notifyListeners();
  }

  // void removeGoal(String toRemove) {
  //   _goals.removeWhere((goal) => goal.id == toRemove);
  //   notifyListeners();
  // }
}
