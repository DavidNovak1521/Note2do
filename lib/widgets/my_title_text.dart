import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';

class MyTitleText extends StatelessWidget {
  final String text;
  final bool smaller;

  const MyTitleText({
    super.key,
    required this.text,
    this.smaller = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: smaller
          ? const EdgeInsets.symmetric(vertical: 10)
          : const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: MyColors.dark,
          fontSize: smaller ? 24 : 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
