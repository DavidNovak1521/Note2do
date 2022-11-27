import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../style/my_colors.dart';
import '../widgets/my_title_text.dart';
import '../providers/notes.dart';
import '../providers/to_dos.dart';
import '../providers/goals.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_horizontal_scroll.dart';

const originalPadding = EdgeInsets.symmetric(horizontal: 15);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final notes = Provider.of<Notes>(context).notesTop5;
    final toDos = Provider.of<ToDos>(context).toDosTop5;
    final goals = Provider.of<Goals>(context).goalsTop5;

    return BasicPageContainer(
      needsPadding: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: originalPadding,
              child: MyTitleText(text: 'Home Page'),
            ),
            const Padding(
              padding: originalPadding,
              child: MyTitleText(
                text: 'Notes',
                smaller: true,
              ),
            ),
            MyHorizontalScroll(
              count: notes.length,
              color: MyColors.primaryBlue,
              labels: [...notes.map((note) => note.getTitle()).toList()],
            ),
            const Padding(
              padding: originalPadding,
              child: MyTitleText(
                text: 'To do\'s',
                smaller: true,
              ),
            ),
            MyHorizontalScroll(
              count: toDos.length,
              color: MyColors.secondaryBlue,
              labels: [...toDos.map((todo) => todo.getText()).toList()],
            ),
            const Padding(
              padding: originalPadding,
              child: MyTitleText(
                text: 'Goals',
                smaller: true,
              ),
            ),
            MyHorizontalScroll(
              count: goals.length,
              color: MyColors.tertiaryBlue,
              labels: [...goals.map((goal) => goal.getText()).toList()],
            ),
            const Divider(
              height: 30,
              color: Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
