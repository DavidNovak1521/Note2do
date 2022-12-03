import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../widgets/basic_page_container.dart';
import '../providers/note.dart';
import '../providers/notes.dart';
import '../style/my_colors.dart';
import '../style/my_texts.dart';

// ignore: must_be_immutable
class NoteEditingPage extends StatelessWidget {
  NoteEditingPage({
    super.key,
    required this.note,
  });

  Note note;

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
                    style: noteEditingTitleTextStyle,
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
                    style: noteEditingTextTextStyle,
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

                      final newNote = Note(
                        id: note.id,
                        title: titleController.text,
                        text: textController.text,
                        isFavorite: note.isFavorite,
                      );

                      Provider.of<Notes>(context, listen: false)
                          .modifyNote(newNote);

                      AutoRouter.of(context).popTop();
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
