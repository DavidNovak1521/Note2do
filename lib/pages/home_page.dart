import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style/my_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          'HomePage',
          style: GoogleFonts.montserrat(
            color: MyColors.black,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
