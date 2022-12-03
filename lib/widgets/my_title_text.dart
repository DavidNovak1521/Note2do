import 'package:flutter/material.dart';

import '../style/my_texts.dart';

class MyTitleText extends StatelessWidget {
  final String text;
  final bool smaller;

  const MyTitleText({
    super.key,
    required this.text,
    this.smaller = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: smaller
          ? const EdgeInsets.symmetric(vertical: 10)
          : const EdgeInsets.symmetric(vertical: 15),
      child: Text(
        text,
        style: smaller ? smallerTitleTextStyle : titleTextStyle,
      ),
    );
  }
}
