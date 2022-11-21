import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../style/my_colors.dart';
import '../../providers/goal.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({super.key});

  @override
  Widget build(BuildContext context) {
    final goal = Provider.of<Goal>(context);

    return Container(
      decoration: BoxDecoration(
        color: MyColors.tertiaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          goal.changeDoneStatus();
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 0,
        title: Text(
          goal.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: goal.isDone ? FontWeight.w600 : FontWeight.w400,
            color: MyColors.white,
          ),
        ),
        leading: Icon(
          goal.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: MyColors.white,
        ),
        // trailing: ,
      ),
    );
  }
}
