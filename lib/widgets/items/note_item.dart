import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';

class NoteItem extends StatelessWidget {
  final String title;
  final String text;

  const NoteItem({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.primaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () => print('$title clicked.'),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: MyColors.white,
          ),
        ),
        subtitle: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MyColors.white.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
