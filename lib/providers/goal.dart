import 'package:flutter/foundation.dart';

class Goal with ChangeNotifier {
  final String id;
  final String text;
  bool isDone;

  Goal({
    required this.id,
    required this.text,
    required this.isDone,
  });
}
