import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';

class NewNote extends StatelessWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        // controller: will be,
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
          hintText: 'Write a new note ...',
        ),
      ),
    );
  }
}
