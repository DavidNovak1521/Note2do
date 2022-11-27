import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notes.dart';

class Note with ChangeNotifier {
  final String id;
  final String title;
  final String text;
  bool isFavorite;

  Note({
    required this.id,
    required this.title,
    required this.text,
    required this.isFavorite,
  });

  String getTitle() {
    return title;
  }

  void changeFavoriteStatus(BuildContext context) {
    isFavorite = !isFavorite;
    notifyListeners();
    Provider.of<Notes>(context, listen: false).refreshNote(this);
  }
}
