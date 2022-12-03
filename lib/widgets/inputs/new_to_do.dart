import 'package:flutter/material.dart';

import '../../providers/to_do.dart';
import '../../style/my_colors.dart';
import '../../style/my_texts.dart';
import '../my_dropdown_button.dart';

final List<DropdownMenuItem<dynamic>> dropdownItems = [
  DropdownMenuItem(
    value: ToDoType.day,
    child: Text(
      'Today',
      style: dropdownTextStyle,
    ),
  ),
  DropdownMenuItem(
    value: ToDoType.week,
    child: Text(
      'This week',
      style: dropdownTextStyle,
    ),
  ),
  DropdownMenuItem(
    value: ToDoType.month,
    child: Text(
      'This month',
      style: dropdownTextStyle,
    ),
  ),
];

// ignore: must_be_immutable
class NewToDo extends StatelessWidget {
  final TextEditingController textCont;

  NewToDo({super.key, required this.textCont});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextField(
            controller: textCont,
            maxLines: 5,
            style: newNoteSemiBoldTextStyle,
            cursorColor: MyColors.dark,
            textAlign: TextAlign.center,
            textCapitalization: TextCapitalization.sentences,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Write a new to do task ...',
            ),
          ),
          MyDropdownButton(
            itemsList: dropdownItems,
          ),
        ],
      ),
    );
  }
}
