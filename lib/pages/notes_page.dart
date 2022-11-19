import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';
import '../widgets/basic_page_container.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicPageContainer(
      child: Text(
        'NotesPage',
        style: GoogleFonts.montserrat(
          color: MyColors.dark,
          fontSize: 30,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
