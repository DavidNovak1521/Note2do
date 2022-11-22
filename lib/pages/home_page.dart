import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/my_title_text.dart';
import '../providers/notes.dart';
import '../providers/to_dos.dart';
import '../providers/goals.dart';
import '../widgets/basic_page_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteNotes = Provider.of<Notes>(context).favoriteNotes;
    final notes = Provider.of<Notes>(context).notes;
    final toDos = Provider.of<ToDos>(context).toDos;
    final goals = Provider.of<Goals>(context).goals;

    return BasicPageContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTitleText(text: 'Home Page'),
          MyTitleText(
            text: 'Notes',
            smaller: true,
          ),
          MyTitleText(
            text: 'To do\'s',
            smaller: true,
          ),
          MyTitleText(
            text: 'Goals',
            smaller: true,
          ),
        ],
      ),
    );
  }
}
