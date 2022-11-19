import 'package:flutter/material.dart';

import '../style/my_colors.dart';

class BasicPageContainer extends StatelessWidget {
  final Widget child;

  const BasicPageContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
