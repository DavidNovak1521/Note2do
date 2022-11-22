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
          'Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg. Ez a leghosszabb szöveg.',
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
      title: 'Cím 9',
      text: 'Valami szöveg',
      isFavorite: false,
    ),
    Note(
      id: 'n10',
      title: 'Cím 10',
      text: 'Valami szöveg',
      isFavorite: false,
    ),
  ];

  List<Note> get notes {
    return [..._notes];
  }
}
