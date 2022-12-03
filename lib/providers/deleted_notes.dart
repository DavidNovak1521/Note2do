import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note.dart';
import 'notes.dart';
import 'to_do.dart';
import 'to_dos.dart';
import 'goal.dart';
import 'goals.dart';

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

  void restoreNote(BuildContext context, String id) {
    final toRestore = _deletedNotes.firstWhere((note) => note.id == id);
    if (toRestore is Note) {
      Provider.of<Notes>(context, listen: false).addNote(toRestore);
    } else if (toRestore is ToDo) {
      Provider.of<ToDos>(context, listen: false).addToDo(toRestore);
    } else if (toRestore is Goal) {
      Provider.of<Goals>(context, listen: false).addGoal(toRestore);
    }
    _deletedNotes.removeWhere((note) => note.id == toRestore.id);
    notifyListeners();
  }
}
