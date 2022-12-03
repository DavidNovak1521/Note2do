import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/goal.dart';
import '../style/my_colors.dart';
import '../style/my_texts.dart';

class MyDateTimePicker extends StatefulWidget {
  const MyDateTimePicker({super.key});

  @override
  State<MyDateTimePicker> createState() => _MyDateTimePickerState();
}

class _MyDateTimePickerState extends State<MyDateTimePicker> {
  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: MediaQuery.of(context).size.height * 0.25,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: MyColors.white,
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: GlobalGoalDate.date,
            mode: CupertinoDatePickerMode.date,
            use24hFormat: true,
            minimumDate: DateTime.now(),
            onDateTimeChanged: (DateTime date) {
              if (date.compareTo(DateTime.now()) > 0) {
                setState(() {
                  GlobalGoalDate.date = date;
                });
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => _showDatePicker(context),
      child: Text(
        DateFormat.yMMMd().format(GlobalGoalDate.date),
        style: datetimeTextStyle,
      ),
    );
  }
}
