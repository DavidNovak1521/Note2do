import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_colors.dart';

// general
final darkTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final darkSemiBoldTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

final whiteTextStyle = GoogleFonts.montserrat(
  color: MyColors.white,
  fontSize: 16,
  fontWeight: FontWeight.w400,
);

final whiteSemiBoldTextStyle = GoogleFonts.montserrat(
  color: MyColors.white,
  fontSize: 16,
  fontWeight: FontWeight.w600,
);

// exact
final titleTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 30,
  fontWeight: FontWeight.w700,
);

final smallerTitleTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

final circularSliderTextStyle = darkSemiBoldTextStyle;

final noteItemTitleTextStyle = whiteSemiBoldTextStyle;

final noteItemTextTextStyle = GoogleFonts.montserrat(
  color: MyColors.white.withOpacity(0.5),
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

final toDoItemTextStyle = whiteTextStyle;

final toDoItemDoneTextStyle = GoogleFonts.montserrat(
  color: MyColors.white.withOpacity(0.5),
  fontSize: 16,
  fontWeight: FontWeight.w400,
  decoration: TextDecoration.lineThrough,
);

final goalItemTextStyle = whiteTextStyle;

final goalItemDoneTextStyle = whiteSemiBoldTextStyle;

final newNoteSemiBoldTextStyle = darkSemiBoldTextStyle;

final newNoteTextStyle = darkTextStyle;

final dropdownTextStyle = darkTextStyle;

final datetimeTextStyle = darkTextStyle;

final segmentTextStyle = darkSemiBoldTextStyle;

final noteEditingTitleTextStyle = darkSemiBoldTextStyle;

final noteEditingTextTextStyle = darkTextStyle;

final missingMessageTextStyle = darkTextStyle;

final toDoTypeTextStyle = GoogleFonts.montserrat(
  color: MyColors.dark,
  fontSize: 14,
  fontWeight: FontWeight.w400,
);

final horizontalScrollTextStyle = whiteTextStyle;
