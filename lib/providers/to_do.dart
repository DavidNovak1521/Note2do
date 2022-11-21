import 'package:flutter/foundation.dart';

class ToDo with ChangeNotifier {
  final String id;
  final String text;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    required this.isDone,
  });
}
