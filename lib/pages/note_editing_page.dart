import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/basic_page_container.dart';
import '../providers/note.dart';
import '../style/my_colors.dart';

final titleTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

final textTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

class NoteEditingPage extends StatelessWidget {
  const NoteEditingPage({
    super.key,
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: note.title);
    final textController = TextEditingController(text: note.text);

    return BasicPageContainer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: titleTextStyle,
              cursorColor: MyColors.dark,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write a title ...',
              ),
            ),
            TextField(
              controller: textController,
              maxLines: null,
              style: textTextStyle,
              cursorColor: MyColors.dark,
              textAlign: TextAlign.start,
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Write a new note ...',
              ),
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
