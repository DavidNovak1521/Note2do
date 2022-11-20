import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../style/my_colors.dart';

class ToDoItem extends StatefulWidget {
  final String text;
  bool isDone;

  ToDoItem({
    super.key,
    required this.text,
    required this.isDone,
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
            widget.isDone = !widget.isDone;
          });
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        title: Text(
          widget.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: widget.isDone
                ? MyColors.white.withOpacity(0.5)
                : MyColors.white,
            decoration: widget.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        leading: Icon(
          widget.isDone
              ? Icons.check_box_rounded
              : Icons.check_box_outline_blank_rounded,
          color: MyColors.white,
        ),
      ),
    );
  }
}
