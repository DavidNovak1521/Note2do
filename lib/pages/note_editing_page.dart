import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      needsMask: false,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      backgroundColor: MyColors.secondaryBlue,
                      foregroundColor: MyColors.white,
                    ),
                    onPressed: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      Clipboard.setData(
                        ClipboardData(
                          text:
                              '${titleController.text}\n\n${textController.text}',
                        ),
                      );
                    },
                    child: const Icon(
                      Icons.copy_rounded,
                      size: 40,
                    ),
                  ),
                  ElevatedButton(
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
