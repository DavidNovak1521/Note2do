import 'package:flutter/material.dart';
import 'package:note2do/widgets/my_datetime_picker.dart';

import '../../style/my_colors.dart';
import '../../style/my_texts.dart';

class NewGoal extends StatelessWidget {
  final TextEditingController textCont;

  const NewGoal({super.key, required this.textCont});

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
              hintText: 'Write a new goal ...',
            ),
          ),
          const MyDateTimePicker(),
        ],
      ),
    );
  }
}
