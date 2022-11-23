import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';

class NewToDo extends StatelessWidget {
  final TextEditingController textCont;

  const NewToDo({super.key, required this.textCont});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        controller: textCont,
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
          hintText: 'Write a new to do task ...',
        ),
      ),
    );
  }
}
