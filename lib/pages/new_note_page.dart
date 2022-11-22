import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';
import '../widgets/my_title_text.dart';

enum NoteType { note, todo, goal }

Map<NoteType, Widget> segments = {
  NoteType.note: Container(),
  NoteType.todo: Container(),
  NoteType.goal: Container(),
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
          const MyTitleText(text: 'New Note'),
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
            child: Center(
              child: Text('Selected: ${_selectedSegment.name}'),
            ),
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
              onPressed: () {},
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

Widget renderNewNote() {
  return Container();
}


// class NewNote extends StatelessWidget {
//   const NewNote({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('NewNote'),);
//   }
// }
