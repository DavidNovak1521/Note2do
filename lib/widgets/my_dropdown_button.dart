import 'package:flutter/material.dart';
import '../../providers/to_do.dart';

// ignore: must_be_immutable
class MyDropdownButton extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> itemsList;
  // ignore: prefer_typing_uninitialized_variables
  var dropdownValue = GlobalToDoType.type;

  MyDropdownButton({
    super.key,
    required this.itemsList,
  });

  @override
  State<MyDropdownButton> createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  void dropdownCallback(selectedValue) {
    setState(() {
      widget.dropdownValue = selectedValue;
      GlobalToDoType.type = selectedValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 15),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          items: widget.itemsList,
          value: widget.dropdownValue,
          onChanged: dropdownCallback,
        ),
      ),
    );
  }
}
