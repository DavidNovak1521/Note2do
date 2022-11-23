import 'package:flutter/material.dart';
import 'package:note2do/style/my_colors.dart';
import 'package:provider/provider.dart';

import '../widgets/my_title_text.dart';
import '../providers/notes.dart';
import '../providers/to_dos.dart';
import '../providers/goals.dart';
import '../widgets/basic_page_container.dart';

const originalPadding = EdgeInsets.symmetric(horizontal: 15);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final favoriteNotes = Provider.of<Notes>(context).favoriteNotes;
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
            HorizontalScroll(
              count: notes.length,
              color: MyColors.primaryBlue,
              child: Container(),
            ),
            const Padding(
              padding: originalPadding,
              child: MyTitleText(
                text: 'To do\'s',
                smaller: true,
              ),
            ),
            HorizontalScroll(
              count: notes.length,
              color: MyColors.secondaryBlue,
              child: Container(),
            ),
            const Padding(
              padding: originalPadding,
              child: MyTitleText(
                text: 'Goals',
                smaller: true,
              ),
            ),
            HorizontalScroll(
              count: notes.length,
              color: MyColors.tertiaryBlue,
              child: Container(),
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

class HorizontalScroll extends StatelessWidget {
  final int count;
  final Color color;
  final Widget child;

  const HorizontalScroll({
    super.key,
    required this.count,
    required this.color,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width * 2 / 5,
      child: ListView.builder(
        itemCount: count,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          width: MediaQuery.of(context).size.width * 2 / 5,
          height: MediaQuery.of(context).size.width * 2 / 5,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: child,
        ),
      ),
    );
  }
}
