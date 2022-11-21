import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';
import '../../providers/goal.dart';

class GoalItem extends StatefulWidget {
  final Goal goal;

  const GoalItem({
    super.key,
    required this.goal,
  });

  @override
  State<GoalItem> createState() => _GoalItemState();
}

class _GoalItemState extends State<GoalItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.tertiaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            widget.goal.isDone = !widget.goal.isDone;
          });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 0,
        title: Text(
          widget.goal.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: widget.goal.isDone ? FontWeight.w600 : FontWeight.w400,
            color: MyColors.white,
          ),
        ),
        leading: Icon(
          widget.goal.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: MyColors.white,
        ),
        // trailing: ,
      ),
    );
  }
}
