import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';

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
          style: GoogleFonts.montserrat(
            color: MyColors.dark,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
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
            style: GoogleFonts.montserrat(
              color: MyColors.dark,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
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
