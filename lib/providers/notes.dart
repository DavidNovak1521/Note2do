import 'package:flutter/material.dart';

import './note.dart';

class Notes with ChangeNotifier {
  final List<Note> _notes = [
    Note(
      id: 'n1',
      title: 'Cím 1',
      text: 'Első szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n2',
      title: 'Cím 2',
      text: 'Második, de már hosszabb szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n3',
      title: 'Cím 3',
      text: 'Harmadik, de még az előzőnél is hosszabb szöveg tesztelni',
      isFavorite: false,
    ),
    Note(
      id: 'n4',
      title: 'Cím 4',
      text:
          'Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg.',
      isFavorite: false,
    ),
    Note(
      id: 'n5',
      title: 'Cím 5, ami hosszabb',
      text: 'Valami szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n6',
      title: 'Cím 6, ami még hosszabb, mint az előző tesztelni',
      text: 'Valami szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n7',
      title: 'Cím 7',
      text: 'Valami szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n8',
      title: 'Cím 8',
      text: 'Valami szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n9',
      title: 'Kedvenc 1',
      text: 'Valami szöveg',
      isFavorite: true,
    ),
    Note(
      id: 'n10',
      title: 'Kedvenc 2',
      text: 'Valami szöveg',
      isFavorite: true,
    ),
  ];

  List<Note> get notes {
    return [..._notes.where((note) => !note.isFavorite)];
  }

  List<Note> get favoriteNotes {
    return [..._notes.where((note) => note.isFavorite)];
  }

  List<Note> get notesTop5 {
    if (_notes.length >= 5) {
      return [..._notes.take(5)];
    } else {
      return [..._notes];
    }
  }

  void refreshNote(Note data) {
    final index = _notes.indexOf(data);
    _notes[index] = data;
    notifyListeners();
  }

  void addNote(String titleToAdd, String textToAdd) {
    _notes.insert(
      0,
      Note(
        id: DateTime.now().toString(),
        title: titleToAdd,
        text: textToAdd,
        isFavorite: false,
      ),
    );
    notifyListeners();
  }

  void removeNote(String toRemove) {
    _notes.removeWhere((note) => note.id == toRemove);
    notifyListeners();
  }
}
