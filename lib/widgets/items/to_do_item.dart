import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../style/my_colors.dart';
import '../../providers/to_do.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({super.key});

  @override
  Widget build(BuildContext context) {
    final toDo = Provider.of<ToDo>(context);

    return Container(
      decoration: BoxDecoration(
        color: MyColors.secondaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          toDo.changeDoneStatus();
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 0,
        title: Text(
          toDo.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color:
                toDo.isDone ? MyColors.white.withOpacity(0.5) : MyColors.white,
            decoration: toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Icon(
          toDo.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: MyColors.white,
        ),
      ),
    );
  }
}
