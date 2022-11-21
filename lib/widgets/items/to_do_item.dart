import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';
import '../../providers/to_do.dart';

class ToDoItem extends StatefulWidget {
  final ToDo toDo;

  const ToDoItem({
    super.key,
    required this.toDo,
  });

  @override
  State<ToDoItem> createState() => _ToDoItemState();
}

class _ToDoItemState extends State<ToDoItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.secondaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        onTap: () {
          setState(() {
            widget.toDo.isDone = !widget.toDo.isDone;
          });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 0,
        title: Text(
          widget.toDo.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: widget.toDo.isDone
                ? MyColors.white.withOpacity(0.5)
                : MyColors.white,
            decoration: widget.toDo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Icon(
          widget.toDo.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: MyColors.white,
        ),
      ),
    );
  }
}
