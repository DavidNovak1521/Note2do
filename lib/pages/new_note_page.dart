import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/to_do.dart';
import '../providers/notes.dart';
import '../providers/to_dos.dart';
import '../providers/goals.dart';
import '../style/my_colors.dart';
import '../style/my_texts.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';
import '../widgets/inputs/new_note.dart';
import '../widgets/inputs/new_to_do.dart';
import '../widgets/inputs/new_goal.dart';

enum NoteType { note, todo, goal }

const Map<NoteType, String> typeName = {
  NoteType.note: 'Note',
  NoteType.todo: 'To do',
  NoteType.goal: 'Goal',
};

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  NoteType _selectedSegment = NoteType.note;
  final noteTitleController = TextEditingController();
  final noteTextController = TextEditingController();
  final toDoController = TextEditingController();
  final goalController = TextEditingController();

  Widget renderTextField(NoteType type) {
    switch (type) {
      case NoteType.note:
        return NewNote(
          titleCont: noteTitleController,
          textCont: noteTextController,
        );

      case NoteType.todo:
        return NewToDo(textCont: toDoController);

      case NoteType.goal:
        return NewGoal(textCont: goalController);

      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    void addNewNote(NoteType type) {
      switch (type) {
        case NoteType.note:
          if (noteTextController.text.isNotEmpty) {
            Provider.of<Notes>(context, listen: false).addNote(
              noteTitleController.text.isNotEmpty
                  ? noteTitleController.text
                  : noteTextController.text.split(' ')[0],
              noteTextController.text,
            );
            noteTitleController.text = '';
            noteTextController.text = '';
          }
          break;

        case NoteType.todo:
          if (toDoController.text.isNotEmpty) {
            Provider.of<ToDos>(context, listen: false)
                .addToDo(toDoController.text, GlobalToDoType.type);
            toDoController.text = '';
          }
          break;

        case NoteType.goal:
          if (goalController.text.isNotEmpty) {
            Provider.of<Goals>(context, listen: false)
                .addGoal(goalController.text);
            goalController.text = '';
          }
          break;

        default:
          break;
      }
    }

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
            child: renderTextField(_selectedSegment),
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
                addNewNote(_selectedSegment);
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
