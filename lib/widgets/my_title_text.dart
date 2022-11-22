import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';

class MyTitleText extends StatelessWidget {
  final String text;
  const MyTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          color: MyColors.dark,
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
