import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../style/my_colors.dart';
import '../../providers/to_do.dart';
import '../../style/my_texts.dart';

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
          toDo.changeDoneStatus(context);
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 0,
        title: Text(
          toDo.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: toDo.isDone ? toDoItemDoneTextStyle : toDoItemTextStyle,
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
