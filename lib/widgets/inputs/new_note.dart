import 'package:flutter/material.dart';

import '../../style/my_colors.dart';
import '../../style/my_texts.dart';

class NewNote extends StatelessWidget {
  final TextEditingController titleCont;
  final TextEditingController textCont;
  const NewNote({
    super.key,
    required this.titleCont,
    required this.textCont,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          controller: titleCont,
          style: newNoteSemiBoldTextStyle,
          cursorColor: MyColors.dark,
          textAlign: TextAlign.center,
          textCapitalization: TextCapitalization.sentences,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Write a title ...',
          ),
        ),
        Expanded(
          child: TextField(
            controller: textCont,
            maxLines: 10,
            style: newNoteTextStyle,
            cursorColor: MyColors.dark,
            textAlign: TextAlign.start,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Write a new note ...',
            ),
          ),
        ),
      ],
    );
  }
}
