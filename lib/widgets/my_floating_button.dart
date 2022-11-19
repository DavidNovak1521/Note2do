import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../style/my_colors.dart';

class MyFloatingButton extends StatelessWidget {
  final TabsRouter tabsRouter;

  // ignore: prefer_const_constructors_in_immutables
  MyFloatingButton({super.key, required this.tabsRouter});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => tabsRouter.setActiveIndex(2),
      backgroundColor: MyColors.tertiaryBlue,
      child: Icon(
        Icons.add,
        color: MyColors.dark,
      ),
    );
  }
}