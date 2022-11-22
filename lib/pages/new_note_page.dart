import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/inputs/new_note.dart';
import '../widgets/inputs/new_to_do.dart';
import '../widgets/inputs/new_goal.dart';

enum NoteType { note, todo, goal }

Map<NoteType, Widget> renderTextField = {
  NoteType.note: NewNote(),
  NoteType.todo: NewToDo(),
  NoteType.goal: NewGoal(),
};

Map<NoteType, String> typeName = {
  NoteType.note: 'Note',
  NoteType.todo: 'To do',
  NoteType.goal: 'Goal',
};

final segmentTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  NoteType _selectedSegment = NoteType.note;

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      needsMask: false,
      child: Column(
        children: [
          MyTitleText(text: 'New ${typeName[_selectedSegment]}'),
          SizedBox(
            width: double.infinity,
            child: CupertinoSlidingSegmentedControl(
              backgroundColor: MyColors.grey1,
              thumbColor: MyColors.buttonBlue,
              groupValue: _selectedSegment,
              children: {
                NoteType.note: Text(
                  'Note',
                  style: segmentTextStyle,
                ),
                NoteType.todo: Text(
                  'To do',
                  style: segmentTextStyle,
                ),
                NoteType.goal: Text(
                  'Goal',
                  style: segmentTextStyle,
                ),
              },
              onValueChanged: (NoteType? value) {
                if (value != null) {
                  setState(() {
                    _selectedSegment = value;
                  });
                }
              },
            ),
          ),
          const Divider(
            height: 15,
            color: Colors.transparent,
          ),
          Expanded(
            child: renderTextField[_selectedSegment]!,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10),
                backgroundColor: MyColors.primaryBlue,
                foregroundColor: MyColors.white,
              ),
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: const Icon(
                Icons.done_rounded,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
